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
