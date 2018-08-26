DROP TABLE IF EXISTS pts;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS bookings;


CREATE TABLE clients(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4
);

CREATE TABLE bookings(
    id SERIAL4 PRIMARY KEY,
    type VARCHAR(255),
    instructor VARCHAR(255),
    capacity INT4
);

CREATE TABLE pts(
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    specialty VARCHAR(255),
    client_id INT4 REFERENCES clients(id) ON DELETE CASCADE NOT NULL,
    booking_id INT4 REFERENCES bookings(id) ON DELETE CASCADE NOT NULL

);
