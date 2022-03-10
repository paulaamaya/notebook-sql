SELECT  COUNT(*)
FROM actors
WHERE date_of_birth > '1970-01-01';

SELECT  MAX(domestic_takings)
FROM movie_revenues;

SELECT  MIN(domestic_takings)
FROM movie_revenues;

SELECT  SUM(movie_length)
FROM movies
WHERE age_certificate = '15';

SELECT  COUNT(*)
FROM directors
WHERE nationality = 'Japanese';

SELECT  AVG(movie_length)
FROM movies
WHERE movie_lang = 'Chinese';
--
SELECT  nationality
       ,COUNT(*)
FROM directors
GROUP BY  nationality
ORDER BY nationality;

SELECT  movie_lang
       ,age_certificate
       ,SUM(movie_length) AS agg_movie_length
FROM movies
GROUP BY  movie_lang
         ,age_certificate
ORDER BY movie_lang;

SELECT  movie_lang
       ,SUM(movie_length) AS agg_movie_length
FROM movies
GROUP BY  movie_lang
HAVING SUM(movie_length) > 500
ORDER BY movie_lang;