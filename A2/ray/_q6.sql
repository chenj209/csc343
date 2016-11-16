set search_path to bnb, public;

DROP VIEW IF EXISTS travelerRequests;
DROP VIEW IF EXISTS travelerBookings;
DROP VIEW IF EXISTS nonTravelers;
DROP VIEW IF EXISTS dedicated;
DROP VIEW IF EXISTS dedicatedNumbers;
DROP VIEW IF EXISTS SOLUTION;

CREATE VIEW travelerRequests as select DISTINCT traveler.travelerid, BookingRequest.listingid from traveler, BookingRequest where
traveler.travelerid = BookingRequest.travelerid;

CREATE VIEW travelerBookings as select DISTINCT traveler.travelerid, booking.listingid from traveler, booking where traveler.travelerid = booking.travelerid;

CREATE VIEW nonTravelers as select * from (select * from travelerRequests EXCEPT select * from travelerBookings) as temp;

CREATE VIEW dedicated as select * from (select * from travelerRequests EXCEPT select * from nonTravelers) as temp;

create view dedicatedNumbers as select dedicated.travelerid, count(*) as numListings from dedicated, travelerBookings where dedicated.travelerid = travelerBookings.travelerid group by dedicated.travelerid;

create view solution as select dedicatedNumbers.travelerid as travelerID, traveler.surname as surname, dedicatedNumbers.numListings as numListings from dedicatedNumbers, traveler  where dedicatedNumbers.travelerid = traveler.travelerid;

	select * from solution;