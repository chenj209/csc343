SET search_path TO bnb, public;

-- View for number of requests for each traveler each year
CREATE OR REPLACE VIEW NumberOfRequest_q1 AS 
SELECT Traveler.travelerId, extract(year FROM startdate) as year,
 count(requestId) AS numRequests
FROM BookingRequest RIGHT JOIN Traveler 
	ON BookingRequest.travelerId = Traveler.travelerId
WHERE (extract(year FROM startdate) > extract(year FROM current_date) - 10 
AND extract(year FROM startdate) <= extract(year FROM current_date))
OR startdate IS NULL
GROUP BY Traveler.travelerId, extract(year FROM startdate);

-- View for number of booking for each traveler each year
CREATE OR REPLACE VIEW NumberOfBooking_q1 AS 
SELECT Traveler.travelerId, extract(year FROM startdate) as year,
 count(listingId) AS numBooking
FROM Booking RIGHT JOIN Traveler 
	ON Booking.travelerId = Traveler.travelerId
WHERE (extract(year FROM startdate) > extract(year FROM current_date) - 10 
AND extract(year FROM startdate) <= extract(year FROM current_date))
OR startdate IS NULL
GROUP BY Traveler.travelerId, extract(year FROM startdate);



SELECT Traveler.travelerId, email, NumberOfRequest_q1.year AS year, 
	numRequests, numBooking
FROM Traveler LEFT JOIN
	(
	NumberOfRequest_q1 JOIN NumberOfBooking_q1  
	ON NumberOfRequest_q1.travelerId = NumberOfBooking_q1.travelerId
	)
	ON Traveler.travelerId = NumberOfRequest_q1.travelerId
ORDER BY NumberOfRequest_q1.year DESC;


