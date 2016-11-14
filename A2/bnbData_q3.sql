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

-- Testing violates min law
INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);

-- Testing does not violate any law.
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);

--Testing violating min but does not violate max.
INSERT INTO Homeowner VALUES (4002, 'hn3', 'hf3', 'hfn3@domain.com');
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'c3', 4002);
INSERT INTO CityRegulation VALUES ('c3', 'house', 'max', 50);
INSERT INTO CityRegulation VALUES ('c3', 'house', 'min', 7);
INSERT INTO Booking VALUES (3002, '2016-01-05', 1001, 5, 1, 120);

-- Testing violating two rules at the same time.
INSERT INTO Homeowner VALUES (4003, 'hn4', 'hf4', 'hfn4@domain.com');
INSERT INTO Listing VALUES (3003, 'house', 2, 4, 'gym', 'c4', 4003);
INSERT INTO CityRegulation VALUES ('c4', 'house', 'min', 5);
INSERT INTO CityRegulation VALUES ('c4', 'house', 'max', 10);
INSERT INTO Booking VALUES (3003, '2016-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3003, '2016-02-06', 1001, 5, 1, 120);

-- Testing span of days across years.
INSERT INTO Homeowner VALUES (4004, 'hn5', 'hf5', 'hfn5@domain.com');
INSERT INTO Listing VALUES (3004, 'house', 2, 4, 'gym', 'c5', 4004);
INSERT INTO CityRegulation VALUES ('c5', 'house', 'max', 4);
INSERT INTO Booking VALUES (3004, '2015-12-31', 1001, 2, 1, 120);
INSERT INTO Booking VALUES (3004, '2016-01-02', 1001, 1, 1, 120);
INSERT INTO Booking VALUES (3004, '2016-12-30', 1001, 5, 1, 120);









