CONNECT 'jdbc:derby:flight-db;create=true';

CREATE TABLE customer
(
	id INTEGER PRIMARY KEY,
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	gender VARCHAR(6),
	CONSTRAINT chk_gender CHECK (gender = 'Male' OR gender = 'Female' OR gender = 'Other')
);

CREATE TABLE flight
(
	id INTEGER PRIMARY KEY,
	flightNumber VARCHAR(5)
);

CREATE TABLE departure
(
	id INTEGER PRIMARY KEY,
	gate VARCHAR(10),
	departureTime DATE
);

CREATE TABLE customer_flights
(
	id INTEGER PRIMARY KEY,
	customerId INTEGER,
	flightId INTEGER,
	CONSTRAINT fk_cf_customerId FOREIGN KEY(customerId) REFERENCES customer(id),
	CONSTRAINT fk_cf_flightId FOREIGN KEY(flightId) REFERENCES flight(id)
);

CREATE TABLE flight_departure
(
	id INTEGER PRIMARY KEY,
	flightId INTEGER,
	departureId INTEGER,
	CONSTRAINT fk_fd_flightId FOREIGN KEY(flightId) REFERENCES flight(id),
	CONSTRAINT fk_fd_departureId FOREIGN KEY(departureId) REFERENCES departure(id)
);

CREATE SEQUENCE customerIdSequence START WITH 11;
CREATE SEQUENCE flightIdSequence START WITH 5;
CREATE SEQUENCE departureSequence START WITH 4;
CREATE SEQUENCE customer_flights_sequence START WITH 15;
CREATE SEQUENCE flight_departure_sequence START WITH 7;

INSERT INTO customer VALUES(1, 'Ned', 'Flanders', 'Male');
INSERT INTO customer VALUES(2, 'Nick', 'Riviera', 'Male');
INSERT INTO customer VALUES(3, 'Julius', 'Hibbert', 'Male');
INSERT INTO customer VALUES(4, 'Moe', 'Szyslak', 'Female');
INSERT INTO customer VALUES(5, 'Brian', 'Griffin', 'Male');
INSERT INTO customer VALUES(6, 'Homer', 'Simpson', 'Male');
INSERT INTO customer VALUES(7, 'Marge', 'Simpson', 'Female');
INSERT INTO customer VALUES(8, 'Bart', 'Simpson', 'Male');
INSERT INTO customer VALUES(9, 'Lisa', 'Simpson', 'Female');
INSERT INTO customer VALUES(10, 'Maggie', 'Simpson', 'Female');

INSERT INTO flight VALUES(1, 'BA001');
INSERT INTO flight VALUES(2, 'BA002');
INSERT INTO flight VALUES(3, 'BA003');
INSERT INTO flight VALUES(4, 'BA004');

INSERT INTO departure VALUES(1, 'D3', '20.02.2016');
INSERT INTO departure VALUES(2, 'C1', '20.02.2016');
INSERT INTO departure VALUES(3, 'E2', '21.02.2016');

INSERT INTO customer_flights VALUES(1, 1, 1);
INSERT INTO customer_flights VALUES(2, 1, 2);
INSERT INTO customer_flights VALUES(3, 2, 2);
INSERT INTO customer_flights VALUES(4, 3, 2);
INSERT INTO customer_flights VALUES(5, 4, 2);
INSERT INTO customer_flights VALUES(6, 5, 3);
INSERT INTO customer_flights VALUES(7, 5, 3);
INSERT INTO customer_flights VALUES(8, 5, 3);
INSERT INTO customer_flights VALUES(9, 6, 2);
INSERT INTO customer_flights VALUES(10, 6, 3);
INSERT INTO customer_flights VALUES(11, 7, 1);
INSERT INTO customer_flights VALUES(12, 8, 1);
INSERT INTO customer_flights VALUES(13, 9, 1);
INSERT INTO customer_flights VALUES(14, 10, 4);

INSERT INTO flight_departure VALUES(1, 1, 2);
INSERT INTO flight_departure VALUES(2, 1, 1);
INSERT INTO flight_departure VALUES(3, 2, 3);
INSERT INTO flight_departure VALUES(4, 3, 1);
INSERT INTO flight_departure VALUES(5, 3, 2);
INSERT INTO flight_departure VALUES(6, 3, 3);