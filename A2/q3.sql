SET search_path TO bnb, public;


CREATE OR REPLACE FUNCTION OVERLAP(LId int) RETURNS BOOLEAN AS $$
BEGIN
IF EXISTS
	(SELECT *
	FROM Booking b1 JOIN Booking b2
	ON b1.listingId = LId AND b2.listingId = b1.listingId AND b1.startdate < b2.startdate
	WHERE b1.startdate + b1.numNights > b2.startdate)
THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION CalculateDays(lId int, year int) RETURNS int
AS $$
DECLARE 
	endOfYear date;
	startOfYear date;
	numDays int;
BEGIN
	endOfYear := to_date(to_char(year, '9999') || '-12-31', 'YYYY-MM-DD');
	startOfYear := to_date(to_char(year, '9999') || '-01-01', 'YYYY-MM-DD');
	SELECT sum(day) INTO numDays FROM (
		(SELECT numNights as day
		 FROM Booking
		 WHERE listingId = $1 
		 	and startdate + numNights <= endOfYear
		 	and startdate >= startOfYear)
		UNION
		(SELECT (endOfYear - startdate + 1) as day
		 FROM Booking
		 WHERE listingId = $1 
		 	and startdate + numNights > endOfYear
		 	and startdate >= startOfYear)
		UNION
		(SELECT (startdate - startOfYear + 1) as day
		 FROM Booking
		 WHERE listingId = $1 
		 	and startdate + numNights > startOfYear
		 	and startdate < startOfYear)
	) totaldays;
	RETURN numDays;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION CheckExceed(total int, days int, type char(3))  
	RETURNS BOOLEAN AS $$
BEGIN
	IF (type = 'max') and (total > days)
	THEN RETURN TRUE;
	ELSIF (type = 'min') and (total < days)
 	THEN RETURN TRUE;
 	ELSE RETURN FALSE;
	END IF; 
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION VIOLATELAW(lId int, year int) RETURNS BOOLEAN
AS $$
BEGIN
	IF EXISTS 
		(SELECT * 
	     FROM CityRegulation, Listing
	     WHERE Listing.listingId = lId 
	     AND (Listing.propertyType = CityRegulation.propertyType 
	     		OR CityRegulation.propertyType = NULL) 
	     AND CheckExceed(CalculateDays(lId, year), days, RegulationType))
	THEN RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql;


-- Create a view to find all valid properties.
CREATE OR REPLACE VIEW ValidBooking_q3 AS
SELECT listingId, startdate, numNights
FROM Booking 
WHERE NOT OVERLAP(listingId);

--Create a view for all years.
CREATE OR REPLACE VIEW AllYears_q3 AS
SELECT year
FROM (
	(SELECT extract(year FROM startdate) AS year
	FROM Booking) 
	UNION
	(SELECT extract(year FROM (Startdate + numNights)) AS year
	FROM Booking)) BookingYear;

-- Create a view of ValidBooking with years.
CREATE OR REPLACE VIEW BookingWithYear_q3 AS
SELECT listingId, startdate, numNights, year
FROM ValidBooking_q3 JOIN AllYears_q3;

SELECT owner AS homeowner, BookingWithYear_q3.listingId AS listingID,
	   year, Listing.city AS city
FROM BookingWithYear_q3 b3 JOIN Listing list
ON b3.listingId = list.listingId
WHERE VIOLATELAW(b3.listingId, b3.year);


