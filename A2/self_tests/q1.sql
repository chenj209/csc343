SET search_path TO bnb, public;

-- View for number of requests for each traveler each year
CREATE OR REPLACE VIEW NumberOfRequest_q1 AS 
SELECT travelerId, extract(year FROM startdate) as year,
 count(requestId) AS numRequests
FROM BookingRequest
WHERE (extract(year FROM startdate) > extract(year FROM current_date) - 10 
AND extract(year FROM startdate) <= extract(year FROM current_date))
GROUP BY travelerId, extract(year FROM startdate);

-- View for number of booking for each traveler each year
CREATE OR REPLACE VIEW NumberOfBooking_q1 AS 
SELECT travelerId, extract(year FROM startdate) as year,
 count(listingId) AS numBooking
FROM Booking
WHERE (extract(year FROM startdate) > extract(year FROM current_date) - 10 
AND extract(year FROM startdate) <= extract(year FROM current_date))
GROUP BY travelerId, extract(year FROM startdate);

-- View for all travelers that has either booked or request in the
-- last ten years.
CREATE OR REPLACE VIEW ActiveUsers_q1 AS 
SELECT travelerId, year FROM (
	(SELECT travelerId, year FROM NumberOfRequest_q1)
	UNION
	(SELECT travelerId, year FROM NumberOfBooking_q1)
) Acitve;

-- View for numRequests and numofbookings of all active users in the
-- last ten years.
CREATE OR REPLACE VIEW Totalinfo_q1 AS
SELECT R.travelerId, R.year, 
	coalesce(numRequests, 0) AS numRequests, 
	coalesce(numBooking, 0) AS numBooking
FROM 
	(-- numRequests of all active users.
	 SELECT ActiveUsers_q1.travelerId, ActiveUsers_q1.year, numRequests 
	 FROM ActiveUsers_q1 LEFT JOIN NumberOfRequest_q1
		ON ActiveUsers_q1.travelerId = NumberOfRequest_q1.travelerId
			AND ActiveUsers_q1.year = NumberOfRequest_q1.year
	) R
	JOIN
	(-- numBooking of all active users.
	 SELECT ActiveUsers_q1.travelerId, ActiveUsers_q1.year, numBooking 
	 FROM ActiveUsers_q1 LEFT JOIN NumberOfBooking_q1
		ON ActiveUsers_q1.travelerId = NumberOfBooking_q1.travelerId
			AND ActiveUsers_q1.year = NumberOfBooking_q1.year
	) B
	ON R.travelerId = B.travelerId AND R.year = B.year;

SELECT Traveler.travelerId, email, year, 
	coalesce(numRequests, 0) AS numRequests, 
	coalesce(numBooking, 0) AS numBooking
FROM Traveler LEFT JOIN Totalinfo_q1
	ON Traveler.travelerId = Totalinfo_q1.travelerId
ORDER BY year DESC;


