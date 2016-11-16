DROP VIEW IF EXISTS hallah_hallah_get_dallah CASCADE;
DROP VIEW IF EXISTS scumbagCities CASCADE;
DROP VIEW IF EXISTS topCity CASCADE;
DROP VIEW IF EXISTS actualScumbags CASCADE;
DROP VIEW IF EXISTS potentialScumbags CASCADE; 
DROP VIEW IF EXISTS eachBooking CASCADE;
DROP VIEW IF EXISTS averageBooking CASCADE;

-- get the average # of booking requests
CREATE VIEW eachBooking AS select  traveler.travelerID, count(*) as count from bookingRequest, traveler 
where bookingRequest.travelerID = traveler.travelerID GROUP BY traveler.travelerID;


-- Average across ALL travelers
CREATE VIEW averageBooking AS select sum(count)/count(traveler.travelerid) as average from eachBooking FULL OUTER JOIN traveler on null;

-- Table naming was done randomly i swear.
CREATE VIEW potentialScumbags as select travelerID from eachBooking where eachBooking.count >= ANY(select average*0 from averageBooking);
set search_path to bnb, public;

-- WHAT ARE THE CHANCES? :DD
CREATE VIEW actualScumbags as select temp.travelerID from ((select * from potentialScumbags) EXCEPT (select travelerID from booking)) as temp; 

-- scrapers and their cities
CREATE VIEW scumbagCities AS SELECT actualScumbags.travelerID, listing.city, count(*) as count from actualScumbags, bookingRequest, listing where 
actualScumbags.travelerID = bookingRequest.travelerID and 
bookingRequest.listingID = listing.listingID 
GROUP BY actualScumbags.travelerID, listing.city 
ORDER BY city ASC;

-- TopCity
CREATE OR REPLACE VIEW topCity as select * from (select *, ROW_NUMBER() OVER (PARTITION BY scumbagCities.travelerid) as rown from scumbagCities) as temp where rown = 1;;

-- I gave up.
CREATE VIEW hallah_hallah_get_dallah as 
select 
traveler.travelerID,  
(traveler.firstname || ' ' || traveler.surname) as name, 
CASE
	WHEN traveler.email IS NULL THEN 'unknown'
	ELSE traveler.email
END as email,
topCity.city as mostRequestedCity,
eachBooking.count as numRequests
from traveler, actualScumbags, eachBooking, TopCity where traveler.travelerID = actualScumbags.travelerID and eachBooking.travelerID = actualScumbags.travelerID and topCity.travelerID = actualScumbags.travelerID
ORDER BY numRequests DESC, travelerID ASC;

select * from hallah_hallah_get_dallah;