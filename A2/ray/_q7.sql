set search_path to bnb, public;

DROP VIEW IF EXISTS PPN;
drop view if exists Bargains;
DROP VIEW IF EXISTS ppn;
DROP VIEW IF EXISTS SOLUTION;
-- price per night
CREATE VIEW PPN as select listingid as listingID, CAST(sum(price) as float)/CAST(sum(numnights) as float) as average from Booking group by listingId;

CREATE VIEW bargains as select booking.travelerid, booking.listingId, CAST(booking.price as float)/CAST(booking.numnights as float)  as pricepernight, ppn.average as average, CAST((1 - CAST(booking.price as float)/CAST(booking.numnights as float)/ppn.average) * 100 as int) as discount from booking, ppn where booking.listingId = ppn.listingid and
CAST(booking.price as float)/CAST(booking.numnights as float) < ppn.average * 0.75;

-- bargains by person (or baby)
CREATE VIEW bby as select travelerid, listingid, max(discount) from bargains GROUP BY travelerid, listingId;

create view solution as select travelerid as travelerID, max(discount) as largestBargainPercentage, max(listingid) as listingID from bargains a where not exists
(select * from bargains b where a.travelerid = b.travelerid and a.listingId != b.listingId and a.discount
 < b.discount) group by travelerid;

select * from solution;