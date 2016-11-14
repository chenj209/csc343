TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;


INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

-- A commited traveler 1000 with two booking requests and two bookings.
INSERT INTO Traveler VALUES (1000, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO Booking VALUES (3000, '2016-10-01', 1000, 2, 1, 90);
INSERT INTO BookingRequest VALUES (6001, 1000, 3001, '2016-10-16', 4, 1, 120);
INSERT INTO Booking VALUES (3001, '2016-01-02', 1000, 5, 1, 120);

-- A commited traveler 1001 with several booking requests and a booking.
INSERT INTO Traveler VALUES (1001, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO BookingRequest VALUES (6002, 1001, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6003, 1001, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6004, 1001, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO Booking VALUES (3000, '2016-01-03', 1001, 5, 1, 120);

-- A non commited traveler 1002 with one successful booking.
INSERT INTO Traveler VALUES (1002, 'n3', 'f3', 'fn3@domain.com');
INSERT INTO BookingRequest VALUES (6005, 1001, 3001, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6006, 1001, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO Booking VALUES (3000, '2016-01-04', 1002, 5, 1, 120);

-- A non commited traveler 1003 who has done nothing.
INSERT INTO Traveler VALUES (1003, 'n4', 'f4', 'fn4@domain.com');

-- A non commited traveler 1004 who has only done a booking.
INSERT INTO Traveler VALUES (1004, 'n5', 'f5', 'fn5@domain.com');
INSERT INTO Booking VALUES (3000, '2016-01-05', 1004, 5, 1, 120);



















