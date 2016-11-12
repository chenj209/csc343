SET search_path TO bnb, public;

CREATE FUNCTION OVERLAP(listingId int) RETURNS BOOLEAN

CREATE FUNCTION VIOLATELAW(listingId int) RETURNS BOOLEAN

CREATE FUNCTION CHECKDAYS(listingId int, days int, type char(3)) 
	RETURNS BOOLEAN
IF type == 'max'
THEN
	IF EXISTS
		(SELECT *
		 FROM Booking
		 WHERE Booking.listingId)
ELSE
ENDIF 