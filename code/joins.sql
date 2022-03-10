-- INNER JOINS
SELECT
       dir.director_id,
       dir.first_name,
       dir.last_name,
       dir.nationality,
       mov.movie_name
FROM
       DIRECTORS AS dir
       INNER JOIN MOVIES AS mov ON dir.director_id = mov.director_id
ORDER BY
       dir.first_name
FETCH FIRST
       10 ROW ONLY;

SELECT
       dir.first_name,
       dir.last_name,
       mov.movie_name,
       mov.release_date
FROM
       DIRECTORS AS dir
       INNER JOIN MOVIES AS mov ON dir.director_id = mov.director_id
WHERE
       mov.movie_lang IN ('Chinese', 'Korean', 'Japanese')
ORDER BY
       mov.release_date;

SELECT
       mov.movie_name,
       mov.release_date,
       rev.international_takings
FROM
       MOVIES AS mov
       INNER JOIN MOVIE_REVENUES AS rev ON mov.movie_id = rev.movie_id
WHERE
       movie_lang = 'English'
ORDER BY
       rev.international_takings;

SELECT
       mov.movie_name,
       rev.domestic_takings,
       rev.international_takings
FROM
       MOVIES AS mov
       INNER JOIN MOVIE_REVENUES AS rev ON mov.movie_id = rev.movie_id
WHERE
       rev.domestic_takings IS NULL
       OR rev.international_takings IS NULL
ORDER BY
       mov.movie_name;

-- LEFT/RIGHT JOINS
SELECT
       dir.director_id,
       dir.first_name,
       dir.last_name,
       dir.nationality,
       COALESCE(mov.movie_name, 'N/A')
FROM
       DIRECTORS AS dir
       LEFT JOIN MOVIES AS mov ON dir.director_id = mov.director_id
ORDER BY
       dir.first_name
FETCH FIRST
       10 ROW ONLY;

SELECT
       dir.first_name,
       dir.last_name,
       mov.movie_name,
       mov.age_certificate
FROM
       DIRECTORS AS dir
       LEFT JOIN MOVIES AS mov ON dir.director_id = mov.director_id
WHERE
       dir.nationality = 'British'
ORDER BY
       dir.first_name;

-- MULTIPLE JOINS
SELECT
       dir.first_name,
       dir.last_name,
       mov.movie_name,
       rev.domestic_takings,
       rev.international_takings
FROM
       DIRECTORS AS dir
       INNER JOIN MOVIES AS mov ON dir.director_id = mov.director_id
       INNER JOIN MOVIE_REVENUES AS rev ON mov.movie_id = rev.movie_id;

SELECT
       ac.first_name,
       ac.last_name,
       mov.movie_name
FROM
       ACTORS AS ac
       INNER JOIN MOVIES_ACTORS AS ma ON ac.actor_id = ma.actor_id
       INNER JOIN MOVIES AS mov ON ma.movie_id = mov.movie_id
WHERE
       mov.movie_lang = 'English';

-- OPERATORS
SELECT
       first_name,
       last_name
FROM
       DIRECTORS
UNION
SELECT
       first_name,
       last_name
FROM
       ACTORS
ORDER BY
       first_name;