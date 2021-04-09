SELECT movie_lang,
       AVG(CAST(age_certificate AS INT)) AS avg_rating,
       COUNT(*) AS num_adult_movies
FROM movies
WHERE age_certificate IN ( '15', '18' )
GROUP BY movie_lang
HAVING AVG(CAST(age_certificate AS INT)) > 15
ORDER BY avg_rating DESC;