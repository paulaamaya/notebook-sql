CREATE TABLE DIRECTORS( director_id serial PRIMARY KEY,
                        first_name VARCHAR ( 30 ),
                        last_name VARCHAR ( 30 ) NOT NULL,
                        date_of_birth DATE,
                        nationality VARCHAR ( 20 ) );

CREATE TABLE ACTORS( actor_id serial PRIMARY KEY,
                     first_name VARCHAR ( 30 ),
                     last_name VARCHAR ( 30 ) NOT NULL,
                     gender CHAR ( 1 ),
                     date_of_birth DATE );

CREATE TABLE MOVIES( movie_id serial PRIMARY KEY,
                     movie_name VARCHAR ( 50 ) NOT NULL,
                     movie_length INT,
                     movie_lang VARCHAR ( 20 ),
                     release_date DATE,
                     age_certificate VARCHAR ( 5 ),
                     director_id INT REFERENCES DIRECTORS(director_id) );

CREATE TABLE MOVIE_REVENUES( revenue_id serial PRIMARY KEY,
                             movie_id INT REFERENCES MOVIES(movie_id),
                             domestic_takings NUMERIC ( 6, 2 ),
                             international_takings NUMERIC ( 6, 2 ) );

CREATE TABLE MOVIES_ACTORS( movie_id INT REFERENCES MOVIES(movie_id),
                            actor_id INT REFERENCES ACTORS(actor_id),
                            PRIMARY KEY ( movie_id, actor_id ) );