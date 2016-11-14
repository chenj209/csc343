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

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 90);

--add 10 Booking record, 5 belongs to 4000, 5 belongs to 4001.
INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1000, 3000, '2016-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6002, 1001, 3001, '2016-01-05', 10, 1, 75);

INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3000, '2013-01-01', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3000, '2014-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3000, '2012-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3000, '2011-10-05', 1000, 2, 1, 90);

INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2015-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2014-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2012-01-05', 1001, 5, 1, 120);
INSERT INTO Booking VALUES (3001, '2011-01-05', 1001, 5, 1, 120);

-- Add 10 TravelerRating record, 4000 has three 5 star, one 4 star and one 1 star.
INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2013-01-01', 5, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2014-10-05', 5, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2012-10-05', 4, 'cmt3');
INSERT INTO TravelerRating VALUES (3000, '2011-10-05', 1, 'cmt3');
-- 4001 has two 1 star, three 4 star.
INSERT INTO TravelerRating VALUES (3001, '2016-01-05', 1, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2015-01-05', 1, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2014-01-05', 4, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2012-01-05', 4, 'cmt3');
INSERT INTO TravelerRating VALUES (3001, '2011-01-05', 4, 'cmt3');

-- Add a HomeOwner who has no rating.
INSERT INTO Homeowner VALUES (4011, 'hl04', 'hf04', NULL);
