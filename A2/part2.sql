CREATE OR REPLACE VIEW TravelerOwnerMatrix AS
SELECT travelerId, homeownerId
FROM Traveler, Homeowner;

CREATE OR REPLACE VIEW TravelerOwnerRating AS
SELECT travelerId, owner AS homeownerId, rating 
FROM TravelerRating JOIN Listing ON TravelerRating.listingId = Listing.listingId;

CREATE OR REPLACE VIEW AvgRatingMaxtirx AS
SELECT T1.travelerId, T1.homeownerId, (SELECT avg(rating) AS AvgRating
								 	   FROM TravelerOwnerRating
								       WHERE travelerId = T1.travelerId AND homeownerId = T1.homeownerId
								       GROUP BY travelerId, homeownerId
								       ) 
FROM TravelerOwnerMatrix T1

SELECT * FROM AvgRatingMaxtirx;

