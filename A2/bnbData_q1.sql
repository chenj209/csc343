TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;

INSERT INTO Traveler VALUES (1000, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1001, 'n2', 'f2', 'fn2@domain.com');

INSERT INTO Traveler VALUES (1003, 'n1', 'f1', 'fn1@domain.com');

INSERT INTO Traveler VALUES (1002, 'n2', 'f2', null);

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

-- 1000 has 2 booking requests and 1001 has one booking request in 2016
INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6012, 1000, 3000, '2016-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6013, 1001, 3001, '2016-01-05', 10, 1, 75);

-- Testing booking request after current date 
INSERT INTO BookingRequest VALUES (6014, 1001, 3001, '2017-01-05', 10, 1, 75);

-- Booking requests of traveler 1002, 5 requests in 2016, 5 request in 2007. 
INSERT INTO BookingRequest VALUES (6001, 1002, 3001, '2016-01-01', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6002, 1002, 3001, '2016-01-02', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6003, 1002, 3001, '2016-01-03', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6004, 1002, 3001, '2016-01-04', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6005, 1002, 3001, '2016-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6006, 1002, 3001, '2007-01-06', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6007, 1002, 3001, '2007-01-07', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6008, 1002, 3001, '2007-01-09', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6009, 1002, 3001, '2007-01-08', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6010, 1002, 3001, '2007-01-10', 10, 1, 75);

-- Testing Booking requests that are not in the last 10 years.
INSERT INTO BookingRequest VALUES (6011, 1002, 3001, '2006-01-10', 10, 1, 75);

-- One Booking for 1000 and 1001.
INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);

-- Bookings of traveler 1002, total 2 bookings.
INSERT INTO Booking VALUES (3000, '2016-01-01', 1002, 5, 1, 120);
INSERT INTO Booking VALUES (3000, '2016-01-02', 1002, 5, 1, 120);

-- Testing booking after 2016
INSERT INTO Booking VALUES (3000, '2017-01-02', 1002, 5, 1, 120);

-- Testing booking before 2007
INSERT INTO Booking VALUES (3000, '2006-01-02', 1002, 5, 1, 120);








