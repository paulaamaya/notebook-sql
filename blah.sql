SELECT COALESCE(first_name, 'First name not provided') AS first_name,
       COALESCE(last_name, 'Last name not provided') AS last_name
FROM actors;