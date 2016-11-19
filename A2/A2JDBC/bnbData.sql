CREATE TABLE BookingRequest (
	requestId integer PRIMARY KEY,
	travelerId integer,
	listingId integer ,
	startdate date NOT NULL,  
	numNights integer NOT NULL default 1, 
	numGuests integer NOT NULL default 1,
	offerPrice integer,
	UNIQUE (travelerId, listingId, startdate)
	);

CREATE TABLE Booking (
       listingId integer,
       startdate date NOT NULL,
       travelerID integer,
       numNights integer NOT NULL default 1,
       numGuests integer NOT NULL default 1,
       price integer NOT NULL,
       PRIMARY KEY (listingId, startdate)
) ;

insert into BookingRequest values
(1000, 2000, 3000, '2015-01-01', 5, 2, 100);

