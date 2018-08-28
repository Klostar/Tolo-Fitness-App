DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS gymclasses;
DROP TABLE IF EXISTS trainers;


CREATE TABLE clients(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4
);

CREATE TABLE gymclasses(
    id SERIAL4 PRIMARY KEY,
    type VARCHAR(255),
    instructor VARCHAR(255),
    capacity INT4
);

CREATE TABLE bookings(
    id SERIAL4 PRIMARY KEY,
    client_id INT4 REFERENCES clients(id) ON DELETE CASCADE NOT NULL,
    gymclass_id INT4 REFERENCES gymclasses(id) ON DELETE CASCADE NOT NULL

);

CREATE TABLE trainers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  job_title VARCHAR(255),
  specialty VARCHAR(255)
);
