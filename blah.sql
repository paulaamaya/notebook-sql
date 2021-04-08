SELECT CONCAT_WS(' ', first_name, last_name) AS full_name
FROM actors
WHERE first_name LIKE 'A%'
ORDER BY last_name;