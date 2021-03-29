CREATE DATABASE owners_pets;
CONNECT TO owners_pets;
CREATE TABLE OWNERS( id serial PRIMARY KEY,
                     first_name VARCHAR ( 30 ),
                     last_name VARCHAR ( 30 ),
                     city VARCHAR ( 30 ),
                     state CHAR ( 2 ) );
CREATE TABLE PETS( id serial PRIMARY KEY,
                   species VARCHAR ( 30 ),
                   full_name VARCHAR ( 30 ),
                   age INT,
                   owner_id INT REFERENCES OWNERS(id) );
ALTER TABLE owners
ADD COLUMN email VARCHAR ( 50 ),
ALTER COLUMN last_name type VARCHAR ( 50 );