SET search_path TO bnb, public;

-- View for 5 star ratings of each owner.
CREATE OR REPLACE VIEW FiveStars AS
SELECT owner, count(T.listingID) as count
FROM TravelerRating T JOIN Listing L 
	ON T.listingID = L.listingID
WHERE rating = 5
GROUP BY owner;

-- View for 4 star ratings of each owner.
CREATE OR REPLACE VIEW FourStars AS
SELECT owner, count(T.listingID) as count
FROM TravelerRating T JOIN Listing L 
	ON T.listingID = L.listingID
WHERE rating = 4
GROUP BY owner;

-- View for 3 star ratings of each owner.
CREATE OR REPLACE VIEW ThreeStars AS
SELECT owner, count(T.listingID) as count
FROM TravelerRating T JOIN Listing L 
	ON T.listingID = L.listingID
WHERE rating = 3
GROUP BY owner;

-- View for 2 star ratings of each owner.
CREATE OR REPLACE VIEW TwoStars AS
SELECT owner, count(T.listingID) as count
FROM TravelerRating T JOIN Listing L 
	ON T.listingID = L.listingID
WHERE rating = 2
GROUP BY owner;

-- View for 1 star ratings of each owner.
CREATE OR REPLACE VIEW OneStars AS
SELECT owner, count(T.listingID) as count
FROM TravelerRating T JOIN Listing L 
	ON T.listingID = L.listingID
WHERE rating = 1
GROUP BY owner;

-- Query for all kinds of ratings
SELECT homeownerID, 
	FiveStars.count as r5, FourStars.count as r4,
	ThreeStars.count as r3, TwoStars.count as r2,
	OneStars.count as r1
FROM (SELECT homeownerID FROM Homeowner) hID LEFT JOIN FiveStars
	ON homeownerID = FiveStars.owner 
	FULL JOIN FourStars ON homeownerID = FourStars.owner
	FULL JOIN ThreeStars ON homeownerID = ThreeStars.owner
	FULL JOIN TwoStars ON homeownerID = TwoStars.owner
	FULL JOIN OneStars ON homeownerID = OneStars.owner
ORDER BY r5 DESC, 
	r4 DESC, 
	r3 DESC, 
	r2 DESC, 
	r1 DESC, 
	homeownerID ASC ;


