set search_path to bnb, public;

DROP VIEW IF EXISTS OwnerRating;
DROP VIEW IF EXISTS one;
DROP VIEW IF EXISTS two;
DROP VIEW IF EXISTS three;
DROP VIEW IF EXISTS four;
DROP VIEW IF EXISTS five;
DROP VIEW IF EXISTS histogram;

CREATE VIEW OwnerRating AS select Homeowner.HomeownerID, HomeownerRating.rating from
Homeowner FULL OUTER JOIN Listing on Homeowner.HomeownerID = Listing.owner
FULL OUTER JOIN HomeownerRating on Listing.ListingID = HomeownerRating.ListingId;

Create View one as select HomeownerID, count(*) from OwnerRating where rating = 1 GROUP BY HomeownerID;
Create View two as select HomeownerID, count(*) from OwnerRating where rating = 2 GROUP BY HomeownerID;
Create View three as select HomeownerID, count(*) from OwnerRating where rating = 3 GROUP BY HomeownerID;
Create View four as select HomeownerID, count(*) from OwnerRating where rating = 4 GROUP BY HomeownerID;
Create View five as select HomeownerID, count(*) from OwnerRating where rating = 5 GROUP BY HomeownerID;

CREATE VIEW histogram as select Homeowner.HomeownerID, 
one.count as r1, two.count as r2, three.count as r3, four.count as r4, five.count as r5 from 
Homeowner FULL OUTER JOIN one on Homeowner.HomeownerID = one.HomeownerID
FULL OUTER JOIN two on Homeowner.HomeownerID = two.HomeownerID 
FULL OUTER JOIN three on Homeowner.HomeownerID = three.HomeownerID
FULL OUTER JOIN four on Homeowner.HomeownerID = four.HomeownerID
FULL OUTER JOIN five on Homeowner.HomeownerID = five.HomeownerID
ORDER BY r5 DESC, r4 DESC, r3 DESC, r2 DESC, r1 DESC, HomeownerID ASC;

select * from histogram;
