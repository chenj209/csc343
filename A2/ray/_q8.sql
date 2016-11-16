set search_path to bnb, public;

DROP VIEW IF EXISTS reciprocals;
DROP VIEW IF EXISTS SOLUTION;
DROP VIEW IF EXISTS backScratches;
CREATE VIEW reciprocals as select booking.travelerID, travelerrating.rating as travelerRating, listing.owner, homeownerrating.rating as homeownerRating 
from TravelerRating, HomeOwnerRating, booking, listing where
TravelerRating.startDate = HomeOwnerRating.startDate and
TravelerRating.listingID = HomeOwnerRating.listingID and 
HomeownerRating.startDate = booking.startDate and
HomeOwnerRating.listingID = booking.listingID and 
booking.listingid = listing.listingid;

create view backScratches as select * from reciprocals where ABS(travelerRating - HomeOwnerRating) <= 1;

create view solution as select traveler.travelerID as travelerID, count(reciprocals.travelerID) as reciprocals, count (backScratches.travelerID) as backScratches from 
traveler FULL OUTER JOIN reciprocals on traveler.travelerID = reciprocals.travelerID
FULL OUTER JOIN backscratches on reciprocals.travelerID = backScratches.travelerID
GROUP BY traveler.travelerID;

select * from solution;