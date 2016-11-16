set search_path to bnb, public;

-- cleanup
DROP VIEW IF EXISTS Date2YearBooking;
DROP VIEW IF EXISTS Last10Booking;
DROP VIEW IF EXISTS AggLast10Booking;
DROP VIEW IF EXISTS Date2YearBookingRequest;
DROP VIEW IF EXISTS Last10BookingRequest;
DROP VIEW IF EXISTS AggLast10BookingRequest;
DROP VIEW IF EXISTS something;
DROP VIEW IF EXISTS solution;


-- Get the # of bookings in last 10 years by year and travelerid

cReAtE OR REPLACE vIeW Date2YearBooking as select travelerID, EXTRACT(YEAR FROM startdate) as year from Booking;

cReATE OR REPLACE vIEw Last10Booking as select * from Date2YearBooking where year >= EXTRACT(YEAR FROM CURRENT_DATE) -10; 

CrEaTe OR REPLACE vIeW AggLast10Booking as select travelerID, year, count(*) as count from Last10Booking GROUP BY travelerID, year;

-- Get number of requests in last 10 years by year and travelerID

CrEaTe OR REPLACE ViEw Date2YearBookingRequest as select travelerID, EXTRACT(YEAR FROM startdate) as year from BookingRequest;

cReATE OR REPLACE vIEw Last10BookingRequest as select * from Date2YearBookingRequest where year >= EXTRACT(YEAR FROM CURRENT_DATE) -10; 

CrEaTe OR REPLACE vIeW AggLast10BookingRequest as select travelerID, year, count(*) as count from Last10BookingRequest GROUP BY travelerID, year;

-- Combine the two tables

-- This was just a debug table, left in here just in case you wanted it

CREAte or REPLace View something as select 
b.travelerid as bid,
b.year as byear,
b.count as bcount,
a.travelerid as aid,
a.year as ayear,
a.count as acount
from AggLast10Booking as b FULL OUTER JOIN 
AggLast10BookingRequest as a on b.year = a.year and b.travelerID = a.travelerID;


-- Case magic
CREAte or REPLace View something2 as select 
CASE
	WHEN a.travelerID IS NULL THEN b.travelerID
	WHEN b.travelerID IS NULL THEN a.travelerID
	ELSE a.travelerID
END as travelerID,
CASE
	WHEN a.year IS NULL THEN b.year
	WHEN b.year IS NULL THEN a.year
	ELSE a.year
END as year,
CASE
	WHEN a.count IS NULL THEN 0
	ELSE a.count
END as request,
CASE
	WHEN b.count IS NULL THEN 0
	ELSE b.count
END as booking
from AggLast10Booking as b FULL OUTER JOIN 
AggLast10BookingRequest as a on b.year = a.year and b.travelerID = a.travelerID;

CREATE OR REPLACE VIEW solution as select traveler.travelerid, traveler.email, something2.year, something2.request as numRequests, something2.booking as numBooking from traveler FULL OUTER JOIN something2 on traveler.travelerid = something2.travelerid ORDER BY something2.year DESC;

select * from solution;