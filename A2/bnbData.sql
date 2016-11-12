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
INSERT INTO Traveler VALUES (1004, 'n2', 'f2', 'fn2@domain.com');

INSERT INTO Traveler VALUES (1005, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1006, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1007, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1008, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1009, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1010, 'n2', 'f2', 'fn2@domain.com');

-- test
INSERT INTO Traveler VALUES (1002, 'n2', 'f2', null);

-- test
INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

--test
--INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
--INSERT INTO BookingRequest VALUES (6001, 1000, 3000, '2016-10-16', 4, 1, 120);
--INSERT INTO BookingRequest VALUES (6002, 1001, 3001, '2016-01-05', 10, 1, 75);
--test


INSERT INTO BookingRequest VALUES (6001, 1002, 3001, '2016-01-01', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6002, 1002, 3001, '2016-01-02', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6003, 1002, 3001, '2016-01-03', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6004, 1002, 3001, '2016-01-04', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6005, 1002, 3001, '2016-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6006, 1002, 3001, '2016-01-06', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6007, 1002, 3001, '2016-01-07', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6008, 1002, 3001, '2016-01-09', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6009, 1002, 3001, '2016-01-08', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6010, 1002, 3001, '2016-01-10', 10, 1, 75);

--test
INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3000, '2016-10-03', 1002, 5, 1, 225);

-- test 


INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');

INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 90);

INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'cmt3');






