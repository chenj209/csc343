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
INSERT INTO Traveler VALUES (1002, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1003, 'n2', 'f2', 'fn2@domain.com');



INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2016-01-06', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2016-01-07', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2016-01-08', 1002, 5, 1, 120);




INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-06', 3, 'cmt2');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-08', 3, 'cmt2');



INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2016-01-05', 1, 'fasfads');
INSERT INTO TravelerRating VALUES (3001, '2016-01-06', 1, 'fasfads');
INSERT INTO TravelerRating VALUES (3001, '2016-01-07', 1, 'fasfads');









