SET search_path TO bnb, public;

-- Create a view to find all the Requests made by each traveler.
CREATE OR REPLACE VIEW TravelerRequest AS
SELECT tavelerId, listingId

-- Create a view to find all the Booking made by each traveler.
CREATE OR REPLACE VIEW TravelerBooking AS
SELECT travelerId, listingId


