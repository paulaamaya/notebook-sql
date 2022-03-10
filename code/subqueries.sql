SELECT  movie_name
       ,movie_length
FROM movies
WHERE movie_length > (
SELECT  AVG(movie_length)
FROM movies );

SELECT  movie_name
FROM movies
WHERE movie_id IN ( SELECT movie_id FROM movie_revenues WHERE international_takings > domestic_takings );

SELECT  mov.movie_name
FROM movies AS mov
JOIN movie_revenues AS rev
ON rev.movie_id = mov.movie_id
WHERE rev.international_takings > rev.domestic_takings;

SELECT  m1.movie_name
       ,m1.movie_length
       ,m1.movie_lang
FROM movies AS m1
WHERE m1.movie_length = (
SELECT  MAX(movie_length)
FROM movies m2
WHERE m1.movie_lang = m2.movie_lang );

SELECT  a1.first_name
       ,a1.last_name
       ,a1.date_of_birth
FROM actors a1
WHERE a1.date_of_birth = (
SELECT  MIN(date_of_birth)
FROM actors a2
WHERE a1.gender = a2.gender );

SELECT  m1.movie_name
       ,m1.movie_length
       ,m1.age_certificate
FROM movies m1
WHERE m1.movie_length > (
SELECT  AVG(movie_length)
FROM movies m2
WHERE m1.age_certificate = m2.age_certificate );