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
WHERE homeownerId <> 4000
FROM AvgRatingMaxtirx A;

CREATE OR REPLACE VIEW Similarity AS
SELECT homeownerId, sum(product) AS score
FROM AvgRatingWithProduct
GROUP BY homeownerId
ORDER BY similarity DESC;

CREATE OR REPLACE VIEW TopTen AS
SELECT homeownerId, score
FROM Similarity
LIMIT 10;

CREATE OR REPLACE VIEW TieTen AS
SELECT homeownerId, score
FROM Similarity
WHERE score = (SELECT score
			   FROM TopTen
			   ORDER BY score ASC
			   LIMIT 1) ten;

SELECT homeownerId, score
FROM (SELECT * FROM TopTen) UNION (SELECT * FROM TieTen)
ORDER BY score DESC;







