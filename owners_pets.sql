CREATE DATABASE owners_pets;
connect TO owners_pets;

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

ALTER TABLE owners 
    DROP COLUMN email;

ALTER TABLE owners 
    rename COLUMN state TO province;

INSERT INTO OWNERS(first_name, last_name, city, province)
VALUES ( 'Paula', 'Amaya', 'Toronto', 'ON' ),
       ( 'Claudia', 'Amaya', 'Toronto', 'ON' ),
       ( 'Bob', 'Smith', 'Vancouver', 'BC' ),
       ( 'Fanny', 'Lu', 'Montreal', 'QC' );

UPDATE owners
SET first_name = 'Linda'
WHERE first_name = 'Fanny';

UPDATE owners
SET city = 'Oakville'
WHERE city = 'Toronto';

UPDATE owners
SET city = 'Leduc',
    province = 'AB'
WHERE first_name = 'Claudia';

UPDATE owners
SET city = 'Oakville',
    province = 'ON'
WHERE first_name = 'Claudia';

DELETE FROM owners
WHERE city = 'Oakville'
    