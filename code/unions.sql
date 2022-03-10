SELECT  first_name
       ,last_name
       ,date_of_birth
FROM ACTORS UNION
SELECT  first_name
       ,last_name
       ,date_of_birth
FROM DIRECTORS
ORDER BY date_of_birth;

SELECT  first_name
       ,last_name
FROM ACTORS
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-12' UNION
SELECT  first_name
       ,last_name
FROM DIRECTORS
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-12'
ORDER BY last_name;

SELECT  first_name
       ,last_name
FROM ACTORS INTERSECT
SELECT  first_name
       ,last_name
FROM DIRECTORS
ORDER BY first_name;

SELECT first_name, last_name
FROM ACTORS
EXCEPT
SELECT first_name, last_name
FROM DIRECTORS;
