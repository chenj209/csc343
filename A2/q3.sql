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

		





--CREATE FUNCTION VIOLATELAW(listingId int) RETURNS BOOLEAN

--CREATE FUNCTION CHECKDAYS(listingId int, days int, type char(3)) 
--	RETURNS BOOLEAN
--IF type == 'max'
--THEN
--	IF EXISTS
--		(SELECT *
--		 FROM Booking
--		 WHERE Booking.listingId)
--ELSE
--ENDIF

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
WHERE VIOLATELAWS(b3.listingId, b3.year);
