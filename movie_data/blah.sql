SELECT *
FROM movie_revenues
where domestic_takings is not null
ORDER BY domestic_takings
FETCH last 3 row only;