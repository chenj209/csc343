set search_path to bnb, public;

DROP VIEW IF EXISTS VALIDBOOKINGS CASCADE;
DROP TABLE IF EXISTS TEMPBOOKING CASCADE;
DROP TABLE IF EXISTS renting CASCADE;
DROP VIEW IF EXISTS daysRentedPerYear CASCADE;
DROP VIEW IF EXISTS MAXVIOLATIONS CASCADE;
DROP VIEW IF EXISTS minRentYear CASCADE;
DROP VIEW IF EXISTS minViolations CASCADE;
DROP VIEW if EXISTS Solutions CASCADE;
-- validBookings

CREATE OR REPLACE VIEW validBookings as select * from booking x where NOT EXISTS(select * from booking z where 
(x.listingID = z.listingID and x.startDate != z.startDate)and ((z.startDate <= (x.startDate + x.numNights + 1) and z.startDate >= x.startDate) or (x.startDate <= (z.startDate + z.numNights + 1) and x.startDate >= z.startDate)));

-- Okay, this question is kinda sadistic, what if there's a guy renting a place for like... 10 years?
-- WELL I'VE GOT A SOLUTION FOR YOU, for only 3 installments of 999999.99


-- Create a temporary table, where we'll be modifying values.
CREATE TABLE tempBooking (
       listingId integer REFERENCES listing,
       startdate date NOT NULL,
       travelerID integer REFERENCES traveler,
       numNights integer NOT NULL default 1,
       numGuests integer NOT NULL default 1,
       price integer NOT NULL,
       rowNumber integer NOT NULL,
       PRIMARY KEY (listingId, startdate)
);

-- Insert into this table, adding row numbers, we'll use these for looping
INSERT INTO tempBooking select *, ROW_NUMBER() OVER (ORDER BY startDate) from validBookings;

CREATE TABLE renting (
	listingId integer REFERENCES listing,
	year integer NOT NULL,
	numNights integer NOT NULL
);

DO
$do$
DECLARE
_n int = (select count(*) from tempBooking);
_x int = 1;
_t int;
_currentYear int;
_tempDate date;
_lastDay date;
_nights int;
_daysInYear int;
_listingId int;
BEGIN 
WHILE _x <= _n 
LOOP
	_tempDate = (select startDate from tempBooking where rowNumber = _x);
	_lastDay = to_date(EXTRACT(YEAR FROM _tempDate) || '-12-31', 'YYYY-MM-DD');
	_daysInYear = _lastDay - _tempDate + 1;
	_nights = (select numNights from tempBooking where rowNumber = _x);
	_listingId = (select listingId from tempBooking where rowNumber = _x);
	_currentYear = EXTRACT(YEAR FROM _tempDate);
	IF _nights <= _daysInYear THEN
	INSERT INTO renting VALUES (_listingId, _currentYear, _nights);
	_x = _x + 1;
	ELSE
	INSERT INTO renting VALUES (_listingId, _currentYear, _daysInYear);
	UPDATE tempBooking SET startDate = startDate +  _daysInYear where rowNumber = _x;
	UPDATE tempBooking SET numNights = numNights - _daysInYear where rowNumber = _x;
	END IF;
END LOOP;
END
$do$;

-- Aggregate the days
CREATE VIEW daysRentedPerYear as select renting.listingId, renting.year, sum(numNights) as numNights from renting GROUP BY listingId, year;

-- Max Day Violations
create view maxViolations as select l.listingId, l.owner, l.city, r.year from daysRentedPerYear r, listing l, cityRegulation c where 
	r.listingId = l.listingId and l.city = c.city and (l.propertyType = c.propertyType or c.propertyType IS NULL) and
	c.regulationType = 'max' and r.numNights > c.days;

-- min rent per year

create view minRentYear as select listingId, EXTRACT(YEAR from startDate) as year, min(numNights)  from validBookings GROUP BY listingId, EXTRACT(YEAR from startDate);

-- min rent violations
create view minViolations as select l.listingId, l.owner, l.city, r.year from minRentYear r, listing l, cityRegulation c where 
	r.listingId = l.listingId and l.city = c.city and (l.propertyType = c.propertyType or c.propertyType IS NULL) and
	c.regulationType = 'min' and r.min < c.days;

CREATE VIEW solutions as select DISTINCT
CASE
	WHEN min.owner IS NULL then max.owner
	WHEN max.owner IS NULL THEN min.owner
	ELSE min.owner
END as homeowner,
CASE
	WHEN min.listingId is NULL then MAX.listingId
	WHEN max.listingID IS NULL then min.listingid
	ELSE min.listingid
END as listingID,
CASE 
	WHEN min.year IS NULL THEN max.year
	WHEN max.year IS NULL THEN min.year
	ELSE min.year
END as year,
CASE
	WHEN min.city IS NULL THEN max.city
	WHEN max.city IS NULL THEN min.city
	ELSE min.city
END as city
from minViolations min FULL OUTER JOIN maxViolations max on min.listingId = max.listingId and min.year = max.year;

select * from solutions;
