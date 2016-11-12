SET search_path TO bnb, public;


-- View for all years appeared in the table
CREATE OR REPLACE VIEW AllYears_q1 AS
SELECT year
FROM (
		(SELECT DISTINCT year FROM (
			SELECT DISTINCT extract(year FROM startdate) AS year
			FROM BookingRequest) B1)
			UNION
		(SELECT DISTINCT year FROM (
			SELECT DISTINCT extract(year FROM startdate) AS year
			FROM Booking) B2
		)
	) unionofrequestsandbooking;

-- View for all travelers with all years
CREATE OR REPLACE VIEW TravelerWithYear_q1 AS
SELECT travelerId, email, year
FROM Traveler, AllYears_q1;

-- View for number of requests for each traveler each year
CREATE OR REPLACE VIEW NumberOfRequest_q1 AS 
SELECT TravelerWithYear_q1.travelerId, year, count(requestId) AS numRequests
FROM BookingRequest RIGHT JOIN TravelerWithYear_q1 
	ON year = extract(year FROM startdate) 
	AND BookingRequest.travelerId = TravelerWithYear_q1.travelerId
WHERE year > 2006 AND year <= 2016
GROUP BY TravelerWithYear_q1.travelerId, year;

-- View for number of booking for each traveler each year
CREATE OR REPLACE VIEW NumberOfBooking_q1 AS 
SELECT TravelerWithYear_q1.travelerId, year, count(listingId) AS numBooking
FROM Booking RIGHT JOIN TravelerWithYear_q1 
	ON year = extract(year FROM startdate)
	AND Booking.travelerId = TravelerWithYear_q1.travelerId
WHERE year > 2006 AND year <= 2016
GROUP BY TravelerWithYear_q1.travelerId, year;




SELECT TravelerWithYear_q1.travelerId, email, NumberOfRequest_q1.year AS year, 
	numRequests, numBooking
FROM TravelerWithYear_q1 JOIN
	(
	NumberOfRequest_q1 JOIN NumberOfBooking_q1  
	ON (NumberOfRequest_q1.travelerId = NumberOfBooking_q1.travelerId
		AND NumberOfRequest_q1.year = NumberOfBooking_q1.year) 
	)
	ON TravelerWithYear_q1.travelerId = NumberOfRequest_q1.travelerId
		AND TravelerWithYear_q1.year = NumberOfRequest_q1.year
ORDER BY NumberOfRequest_q1.year DESC;


