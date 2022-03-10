SELECT  movie_name
       ,release_date
FROM movies;

SELECT  first_name
       ,last_name
FROM directors
WHERE nationality = 'American';

SELECT  *
FROM actors
WHERE date_of_birth > '1970-01-01'
AND gender = 'M';

SELECT  *
FROM movies
WHERE movie_length > 90
AND movie_lang = 'English';

SELECT  movie_name
       ,movie_lang
FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');

SELECT  first_name
       ,last_name
FROM actors
WHERE last_name LIKE 'M%'
AND ( date_of_birth BETWEEN '1940-01-01' AND '1969-12-31' );

SELECT  first_name
       ,last_name
FROM directors
WHERE nationality IN ('British', 'French', 'German')
AND ( date_of_birth BETWEEN '1950-01-01' AND '1980-12-31' );

SELECT  *
FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth;

SELECT  DISTINCT nationality
FROM directors;

SELECT  first_name
       ,last_name
       ,date_of_birth
FROM actors
WHERE gender = 'F'
AND date_of_birth IS NOT NULL
ORDER BY date_of_birth DESC
LIMIT 10;

SELECT  *
FROM movie_revenues
WHERE international_takings IS NOT NULL
ORDER BY international_takings DESC
LIMIT 3;

SELECT  CONCAT_WS(' ',first_name,last_name) AS full_name
FROM directors;

SELECT  *
FROM actors
WHERE first_name IS NULL OR date_of_birth IS NULL;

SELECT  movie_id
       ,COALESCE(domestic_takings,0)
       ,COALESCE(international_takings,0)
-- prevents summation
FROM resulting IN NULL ,
( COALESCE(domestic_takings, 0) + COALESCE(international_takings, 0)
) AS total_takings
FROM movie_revenues;

SELECT  CONCAT_WS(' ',first_name,last_name)        AS full_name
       ,COALESCE(date_of_birth,'DOB not provided') AS date_of_birth
FROM actors;

SELECT  COALESCE(first_name,'First name not provided') AS first_name
       ,COALESCE(last_name,'Last name not provided')   AS last_name
FROM actors;