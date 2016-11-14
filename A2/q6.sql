SET search_path TO bnb, public;

-- Create a view to find all the Requests made by each traveler.
CREATE OR REPLACE VIEW TravelerRequest AS
SELECT travelerId, listingId
FROM BookingRequest
GROUP BY travelerId, listingId;

-- Create a view to find all the Booking made by each traveler.
CREATE OR REPLACE VIEW TravelerBooking AS
SELECT travelerId, listingId
FROM Booking
GROUP BY travelerId, listingId;

-- Create a view to find non-committed travelers.
CREATE OR REPLACE VIEW NonCommitted AS
(SELECT * FROM TravelerRequest) EXCEPT (SELECT * FROM TravelerBooking);

SELECT b.travelerId AS travelerID, surname, count(listingId) AS numListings
FROM Booking b LEFT JOIN Traveler t
ON b.travelerId = t.travelerId
WHERE b.travelerId NOT IN (
	SELECT travelerId FROM NonCommitted)
GROUP BY b.travelerId, surname
ORDER BY b.travelerID ASC;
