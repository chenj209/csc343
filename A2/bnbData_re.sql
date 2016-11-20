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
INSERT INTO Homeowner VALUES (4002, 'hn3', 'hf3', 'hfn3@domain.com');
INSERT INTO Homeowner VALUES (4003, 'hn4', 'hf4', 'hfn4@domain.com');
INSERT INTO Homeowner VALUES (4004, 'hn5', 'hf5', 'hfn5@domain.com');
INSERT INTO Homeowner VALUES (4005, 'hn6', 'hf6', 'hfn6@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'c3', 4002);
INSERT INTO Listing VALUES (3003, 'house', 2, 4, 'gym', 'c4', 4003);
INSERT INTO Listing VALUES (3004, 'house', 2, 4, 'gym', 'c5', 4004);
INSERT INTO Listing VALUES (3005, 'house', 2, 4, 'gym', 'c6', 4005);

INSERT INTO BookingRequest VALUES (2000, 1000, 3000, '2010-01-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2001, 1001, 3000, '2010-01-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2002, 1002, 3000, '2010-01-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2003, 1003, 3000, '2010-01-04', 1, 1, 100);

INSERT INTO BookingRequest VALUES (2010, 1000, 3001, '2010-02-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2011, 1001, 3001, '2010-02-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2012, 1002, 3001, '2010-02-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2013, 1003, 3001, '2010-02-04', 1, 1, 100);

INSERT INTO BookingRequest VALUES (2020, 1000, 3002, '2010-03-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2021, 1001, 3002, '2010-03-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2022, 1002, 3002, '2010-03-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2023, 1003, 3002, '2010-03-04', 1, 1, 100);

INSERT INTO BookingRequest VALUES (2030, 1000, 3003, '2010-04-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2031, 1001, 3003, '2010-04-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2032, 1002, 3003, '2010-04-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2033, 1003, 3003, '2010-04-04', 1, 1, 100);

INSERT INTO BookingRequest VALUES (2040, 1000, 3004, '2010-05-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2041, 1001, 3004, '2010-05-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2042, 1002, 3004, '2010-05-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2043, 1003, 3004, '2010-05-04', 1, 1, 100);

INSERT INTO BookingRequest VALUES (2050, 1000, 3005, '2010-06-01', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2051, 1001, 3005, '2010-06-02', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2052, 1002, 3005, '2010-06-03', 1, 1, 100);
INSERT INTO BookingRequest VALUES (2053, 1003, 3005, '2010-06-04', 1, 1, 100);


INSERT INTO Booking VALUES (3000, '2010-01-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3000, '2010-01-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3000, '2010-01-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3000, '2010-01-04', 1003, 1, 1, 100);

INSERT INTO Booking VALUES (3001, '2010-02-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3001, '2010-02-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3001, '2010-02-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3001, '2010-02-04', 1003, 1, 1, 100);

INSERT INTO Booking VALUES (3002, '2010-03-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3002, '2010-03-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3002, '2010-03-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3002, '2010-03-04', 1003, 1, 1, 100);

INSERT INTO Booking VALUES (3003, '2010-04-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3003, '2010-04-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3003, '2010-04-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3003, '2010-04-04', 1003, 1, 1, 100);

INSERT INTO Booking VALUES (3004, '2010-05-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3004, '2010-05-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3004, '2010-05-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3004, '2010-05-04', 1003, 1, 1, 100);

INSERT INTO Booking VALUES (3005, '2010-06-01', 1000, 1, 1, 100);
INSERT INTO Booking VALUES (3005, '2010-06-02', 1001, 1, 1, 100);
INSERT INTO Booking VALUES (3005, '2010-06-03', 1002, 1, 1, 100);
INSERT INTO Booking VALUES (3005, '2010-06-04', 1003, 1, 1, 100);


INSERT INTO TravelerRating VALUES (3000, '2010-01-01', 5, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-01-02', 5, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-01-03', 5, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-01-04', 5, 'cm');

INSERT INTO TravelerRating VALUES (3001, '2010-02-01', 4, 'cm');
INSERT INTO TravelerRating VALUES (3001, '2010-02-02', 4, 'cm');
INSERT INTO TravelerRating VALUES (3001, '2010-02-03', 4, 'cm');
INSERT INTO TravelerRating VALUES (3001, '2010-02-04', 4, 'cm');

INSERT INTO TravelerRating VALUES (3002, '2010-03-01', 3, 'cm');
INSERT INTO TravelerRating VALUES (3002, '2010-03-02', 3, 'cm');
INSERT INTO TravelerRating VALUES (3002, '2010-03-03', 3, 'cm');
INSERT INTO TravelerRating VALUES (3002, '2010-03-04', 3, 'cm');

INSERT INTO TravelerRating VALUES (3003, '2010-04-01', 2, 'cm');
INSERT INTO TravelerRating VALUES (3003, '2010-04-02', 2, 'cm');
INSERT INTO TravelerRating VALUES (3003, '2010-04-03', 2, 'cm');
INSERT INTO TravelerRating VALUES (3003, '2010-04-04', 2, 'cm');

INSERT INTO TravelerRating VALUES (3004, '2010-05-01', 1, 'cm');
INSERT INTO TravelerRating VALUES (3004, '2010-05-02', 1, 'cm');
INSERT INTO TravelerRating VALUES (3004, '2010-05-03', 1, 'cm');
INSERT INTO TravelerRating VALUES (3004, '2010-05-04', 1, 'cm');

INSERT INTO TravelerRating VALUES (3000, '2010-06-01', 1, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-06-02', 1, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-06-03', 1, 'cm');
INSERT INTO TravelerRating VALUES (3000, '2010-06-04', 1, 'cm');

