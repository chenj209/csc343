SET search_path TO bnb, public;

-- View for number of requests for each traveler.
CREATE OR REPLACE VIEW NumberOfRequest_q2 AS 
SELECT travelerId, count(requestId) AS numRequests
FROM BookingRequest 
GROUP BY travelerId;

-- View for number of booking for each traveler.
CREATE OR REPLACE VIEW NumberOfBooking_q2 AS 
SELECT travelerId, count(listingId) AS numBooking
FROM Booking
GROUP BY travelerId;

-- View for total number of requests and booking for each traveler.
CREATE OR REPLACE VIEW TotalInfo_q2 AS
SELECT Traveler.travelerId, 
  	   (surname || ' ' || firstname) AS name, 
  	   coalesce(email, 'unknown') AS email, 
       coalesce(numRequests, 0) AS numRequests, 
       coalesce(numBooking, 0) AS numBooking
FROM (
	Traveler LEFT JOIN NumberOfRequest_q2
	ON Traveler.travelerId = NumberOfRequest_q2.travelerId
	) LEFT JOIN NumberOfBooking_q2
	ON Traveler.travelerId = NumberOfBooking_q2.travelerId;

-- View for listingId & city.
CREATE OR REPLACE VIEW listingIdCity_q2 AS
SELECT travelerId, city AS mostRequestedCity
FROM BookingRequest B JOIN Listing 
ON B.listingId = Listing.listingId
GROUP BY B.travelerId, city
HAVING city = (
		SELECT city
		FROM BookingRequest JOIN Listing
		ON BookingRequest.listingId = Listing.listingId
		WHERE travelerId = B.travelerId
		GROUP BY city
		ORDER BY count(BookingRequest.listingId) DESC, city ASC 
		LIMIT 1
			);


SELECT TotalInfo_q2.travelerId, name, email, mostRequestedCity, numRequests
FROM TotalInfo_q2 JOIN listingIdCity_q2
	ON TotalInfo_q2.travelerId = listingIdCity_q2.travelerId
WHERE numRequests >= (
	SELECT (10 * avg(numRequests)) AS tentimesavg
	FROM TotalInfo_q2
	) AND numBooking = 0
ORDER BY numRequests DESC, name ASC;
