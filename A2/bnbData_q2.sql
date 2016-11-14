TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;

-- Ten travelers in total, n0, n1, n2 be the scraper.
INSERT INTO Traveler VALUES (1000, 'n0', 'f0', 'fn0@domain.com');
INSERT INTO Traveler VALUES (1001, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1002, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1003, 'n3', 'f3', 'fn3@domain.com');
INSERT INTO Traveler VALUES (1004, 'n4', 'f4', 'fn4@domain.com');
INSERT INTO Traveler VALUES (1005, 'n5', 'f5', 'fn5@domain.com');
INSERT INTO Traveler VALUES (1006, 'n6', 'f6', 'fn6@domain.com');
INSERT INTO Traveler VALUES (1007, 'n7', 'f7', 'fn7@domain.com');
INSERT INTO Traveler VALUES (1008, 'n8', 'f8', 'fn8@domain.com');
INSERT INTO Traveler VALUES (1009, 'n9', 'f9', 'fn9@domain.com');
INSERT INTO Traveler VALUES (1010, 'n10', 'f10', 'fn10@domain.com');
INSERT INTO Traveler VALUES (1011, 'n11', 'f11', 'fn11@domain.com');
INSERT INTO Traveler VALUES (1012, 'n12', 'f12', 'fn12@domain.com');
INSERT INTO Traveler VALUES (1013, 'n13', 'f13', 'fn13@domain.com');
INSERT INTO Traveler VALUES (1014, 'n14', 'f14', 'fn14@domain.com');
INSERT INTO Traveler VALUES (1015, 'n15', 'f15', 'fn15@domain.com');
INSERT INTO Traveler VALUES (1016, 'n16', 'f16', 'fn16@domain.com');
INSERT INTO Traveler VALUES (1017, 'n17', 'f17', 'fn17@domain.com');
INSERT INTO Traveler VALUES (1018, 'n18', 'f18', 'fn18@domain.com');
INSERT INTO Traveler VALUES (1019, 'n19', 'f19', 'fn19@domain.com');
INSERT INTO Traveler VALUES (1020, 'n20', 'f20', 'fn20@domain.com');
INSERT INTO Traveler VALUES (1021, 'n21', 'f21', 'fn21@domain.com');
INSERT INTO Traveler VALUES (1022, 'n22', 'f22', 'fn22@domain.com');
INSERT INTO Traveler VALUES (1023, 'n23', 'f23', 'fn23@domain.com');
INSERT INTO Traveler VALUES (1024, 'n24', 'f24', 'fn24@domain.com');
INSERT INTO Traveler VALUES (1025, 'n25', 'f25', 'fn25@domain.com');
INSERT INTO Traveler VALUES (1026, 'n26', 'f26', 'fn26@domain.com');
INSERT INTO Traveler VALUES (1027, 'n27', 'f27', 'fn27@domain.com');
INSERT INTO Traveler VALUES (1028, 'n28', 'f28', 'fn28@domain.com');
INSERT INTO Traveler VALUES (1029, 'n29', 'f29', 'fn29@domain.com');
INSERT INTO Traveler VALUES (1030, 'n30', 'f30', 'fn30@domain.com');

-- Insert three scrapers: s1, s2, s3, s3 has no email address.
INSERT INTO Traveler VALUES (1031, 's1', 'f31', 's1@domain.com');
INSERT INTO Traveler VALUES (1032, 's2', 'f32', 's2@domain.com');
INSERT INTO Traveler VALUES (1033, 's3', 'f33', NULL);



INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);

-- s3 has 6 booking requests, s1 and s2 has 5.

-- s1's requests:
INSERT INTO BookingRequest VALUES (6000, 1031, 3000, '2016-01-01', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1031, 3000, '2015-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6002, 1031, 3001, '2011-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6003, 1031, 3001, '2010-01-01', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6004, 1031, 3001, '2009-01-02', 10, 1, 75);

-- s2's requests:
INSERT INTO BookingRequest VALUES (6005, 1032, 3000, '2016-01-03', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6006, 1032, 3000, '2016-01-04', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6007, 1032, 3000, '2016-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6008, 1032, 3000, '2016-01-06', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6009, 1032, 3001, '2016-01-07', 10, 1, 75);

-- s3's requests:
INSERT INTO BookingRequest VALUES (6010, 1033, 3000, '2016-01-09', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6011, 1033, 3001, '2011-01-08', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6012, 1033, 3001, '2012-01-10', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6013, 1033, 3001, '2013-01-08', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6014, 1033, 3001, '2014-01-10', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6015, 1033, 3001, '2015-01-10', 10, 1, 75);

-- Some irrelevant bookings.
INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1001, 5, 1, 120);


INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');

INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 1);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'min', 10);

INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'cmt3');






