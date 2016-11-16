set search_path to bnb, public;

DROP VIEW IF EXISTS averageRatingPerYear CASCADE;
DROP VIEW IF EXISTS ownersWhoDecrease CASCADE;
DROP VIEW IF EXISTS last10years CASCADE;
DROP VIEW IF EXISTS ownersWhoDontDecrease CASCADE;
DROP VIEW IF EXISTS Percentage CASCADE;

CREATE VIEW averageRatingPerYear as select 
listing.owner, EXTRACT(year FROM Homeownerrating.startdate) as year, avg(Homeownerrating.rating) as average
from Homeownerrating, listing 
where Homeownerrating.listingId = listing.listingId 
GROUP BY listing.owner, EXTRACT(year FROM Homeownerrating.startdate); 

CREATE VIEW last10Years as select * from averageRatingPerYear where averageRatingPerYear.year >= EXTRACT(year FROM CURRENT_DATE) - 10;

CREATE VIEW ownersWhoDecrease AS SELECT * FROM last10Years a where EXISTS (
	select * from last10Years b where a.average < b.average and a.year > b.year);

CREATE VIEW ownersWhoDontDecrease AS Select owner from ((select owner from listing) EXCEPT (select owner from ownersWhoDecrease)) as temp;

CREATE VIEW Percentage as select count(ownersWhoDontDecrease.owner) as top, count(DISTINCT last10years.owner) as bottom, CAST(count(ownersWhoDontDecrease.owner) as float)/CAST(count(DISTINCT last10years.owner) as float) as average from ownersWhoDontDecrease FULL OUTER JOIN last10Years on null;

select average from percentage;
