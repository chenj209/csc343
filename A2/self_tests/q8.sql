SET search_path TO bnb, public;

-- Create a view to find all reciprocal rating.
CREATE OR REPLACE VIEW ReciprocalRating AS
SELECT hr.listingId, hr.startDate, @(hr.rating - tr.rating) AS differ
FROM HomeownerRating hr JOIN TravelerRating tr
ON hr.listingId = tr.listingId AND hr.startDate = tr.startDate;

-- Create a view to find total number of reciprocals.
CREATE OR REPLACE VIEW totalRec AS
SELECT travelerID, count(differ) AS reciprocals
FROM Booking b JOIN ReciprocalRating r
ON b.listingId = r.listingId AND b.startDate = r.startDate
GROUP BY travelerId;

-- Create a view to find total number of backScratches.
CREATE OR REPLACE VIEW totalBack AS
SELECT travelerID, count(differ) AS backScratches
FROM Booking b JOIN ReciprocalRating r
ON b.listingId = r.listingId AND b.startDate = r.startDate
WHERE differ <= 1
GROUP BY travelerId;

SELECT t.travelerID AS travelerID, coalesce(reciprocals, 0) AS reciprocals, 
	coalesce(backScratches, 0) AS backScratches
FROM Traveler t LEFT JOIN totalRec tr ON T.travelerId = tr.travelerId
				LEFT JOIN totalBack tb ON t.travelerID = tb.travelerID
ORDER BY coalesce(reciprocals, 0) DESC, coalesce(backScratches, 0) DESC;
