SET search_path TO bnb, public;

-- Create a view to find all the Requests made by each traveler.
CREATE VIEW OR REPLACE TravelerRequest AS
SELECT tavelerId, listingId

-- Create a view to find all the Booking made by each traveler.
CREATE VIEW OR REPLACE TravelerBooking AS
SELECT travelerId, listingId
