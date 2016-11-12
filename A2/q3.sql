SET search_path TO bnb, public;

CREATE FUNCTION OVERLAP(listingId int) RETURNS BOOLEAN

CREATE FUNCTION VIOLATELAW(listingId int) RETURNS BOOLEAN



CREATE FUNCTION CalculateDays(listingId int, year int) RETURNS int
AS $$
BEGIN
	
	

CREATE OR REPLACE VIEW BookingWithStartEnd AS 
SELECT listingId, startdate, (startdate + numNights) AS enddate
FROM Booking;

CREATE FUNCTION CheckExceed(lId int, days int, type char(3))  
	RETURNS BOOLEAN AS $$
BEGIN
IF (type == 'max')
THEN
	IF EXISTS
		(SELECT *
		 FROM Booking
		 WHERE Booking.listingId = lId
		 	and Booking.numNights > days)
	THEN RETURN TRUE;
	END IF;
ELSIF (type == 'min')
	IF EXISTS
		(SELECT *
		 FROM Booking
		 WHERE Booking.listingId = lId
		 	and Booking.numNights < days)
	THEN RETURN TRUE;
	END IF;
END IF; 
END;
$$ LANGUAGE plpgsql;