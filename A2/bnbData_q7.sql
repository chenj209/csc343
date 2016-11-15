TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;

-- Testing one good bargainer 1000 with 3 distinct listings 
-- with one largest percentage.
INSERT INTO Traveler VALUES (1000, 'n1', 'f1', 'fn1@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4000);
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'c2', 4000);
INSERT INTO Booking VALUES (3000, '2016-10-01', 1000, 2, 1, 100);
INSERT INTO Booking VALUES (3001, '2016-10-02', 1000, 2, 1, 200);
INSERT INTO Booking VALUES (3002, '2016-10-03', 1000, 2, 1, 300);

INSERT INTO Traveler VALUES (1001, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Booking VALUES (3000, '2016-10-04', 1001, 2, 1, 100000);
INSERT INTO Booking VALUES (3001, '2016-10-05', 1001, 2, 1, 100000);
INSERT INTO Booking VALUES (3002, '2016-10-06', 1001, 2, 1, 100000);

-- Testing one good bargainer that has multiple largest percentage.
INSERT INTO Traveler VALUES (1002, 'n1', 'f1', 'fn1@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Listing VALUES (3003, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3004, 'house', 2, 4, 'gym', 'c2', 4000);
INSERT INTO Listing VALUES (3005, 'house', 2, 4, 'gym', 'c2', 4000);
INSERT INTO Booking VALUES (3003, '2016-10-01', 1002, 2, 1, 0);
INSERT INTO Booking VALUES (3004, '2016-10-02', 1002, 2, 1, 0);
INSERT INTO Booking VALUES (3005, '2016-10-03', 1002, 2, 1, 0);

INSERT INTO Traveler VALUES (1003, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Booking VALUES (3003, '2016-10-04', 1003, 2, 1, 100000);
INSERT INTO Booking VALUES (3004, '2016-10-05', 1003, 2, 1, 100000);
INSERT INTO Booking VALUES (3005, '2016-10-06', 1003, 2, 1, 100000);









