CREATE OR REPLACE VIEW TravelerOwnerMatrix AS
SELECT travelerId, homeownerId
FROM Traveler, Homeowner;

CREATE OR REPLACE VIEW TravelerOwnerRating AS
SELECT travelerId, owner AS homeownerId, rating 
FROM TravelerRating T JOIN Booking B
	ON T.listingId = B.listingId AND T.startdate = B.startdate
JOIN Listing ON T.listingId = Listing.listingId;

CREATE OR REPLACE VIEW AvgRatingMaxtirx AS
SELECT T1.travelerId, T1.homeownerId, (SELECT avg(rating) AS AvgRating
								 	   FROM TravelerOwnerRating
								       WHERE travelerId = T1.travelerId AND homeownerId = T1.homeownerId
								       GROUP BY travelerId, homeownerId
								       ) AS avgRating
FROM TravelerOwnerMatrix T1;

CREATE OR REPLACE VIEW AvgRatingWithProduct AS
SELECT homeownerId, (coalesce(avgRating, 0) * (SELECT avgRating
								               FROM AvgRatingMaxtirx
								               WHERE travelerId = A.travelerId
								               AND homeownerId = 4000) ) AS product
FROM AvgRatingMaxtirx A
WHERE homeownerId <> 4000;

CREATE OR REPLACE VIEW Similarity AS
SELECT homeownerId, sum(product) AS score
FROM AvgRatingWithProduct
GROUP BY homeownerId
ORDER BY score DESC;

CREATE OR REPLACE VIEW TopTen AS
SELECT homeownerId, score
FROM Similarity
LIMIT 4;

CREATE OR REPLACE VIEW TieTen AS
SELECT homeownerId, score
FROM Similarity
WHERE score = (SELECT score
			   FROM TopTen
			   ORDER BY score ASC
			   LIMIT 1);

SELECT homeownerId, score FROM (
      (SELECT homeownerId, score FROM TopTen) 
	UNION
      (SELECT homeownerId, score FROM TieTen)
) foo
ORDER BY score DESC;







