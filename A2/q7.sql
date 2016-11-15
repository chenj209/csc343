SET search_path TO bnb, public;

-- Create a view to find the average price.
CREATE OR REPLACE VIEW AvgPrice AS
SELECT listingId, (sum(price) ::real/ sum(numNights)) AS avgPrice
FROM Booking
GROUP BY listingId;

-- Create a view for the bargain percentage for each booking.
CREATE OR REPLACE VIEW BargainPer AS
SELECT b.listingId, b.travelerId, ((avgPrice - price) ::real/ avgPrice) AS bargainPercentage
FROM Booking b JOIN AvgPrice ap
ON b.listingId = ap.listingId
WHERE ((avgPrice - price) ::real/ avgPrice) >= 0.25;

-- Create a view for the good bargainers and their largestBargainPercentage
CREATE OR REPLACE VIEW GoodBargainer AS
SELECT travelerId, max(bargainPercentage) AS maxBargainPercentage
FROM BargainPer
GROUP BY travelerId;
HAVING count(listingId) >= 3;

SELECT bp.travelerId AS travelerID, 
	(bp.bargainPercentage * 100)::int AS largestBargainPercentage, listingID
FROM BargainPer bp JOIN GoodBargainer gb
ON bp.travelerId = gb.travelerId
WHERE bp.bargainPercentage = maxBargainPercentage
ORDER BY bp.bargainPercentage DESC, bp.travelerId ASC, listingID ASC;
