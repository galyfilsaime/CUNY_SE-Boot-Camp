-- Part A
SELECT COUNT(*) FROM actors
UNION ALL
SELECT COUNT(*) FROM directors
UNION ALL
SELECT COUNT(*) FROM movies
UNION ALL
SELECT COUNT(*) FROM movie_revenues
UNION ALL
SELECT COUNT(*) FROM movies_actors;

-- Part B
-- Query 1
SELECT movie_name, release_date
FROM movies;

-- Query 2
SELECT first_name, last_name
FROM directors
WHERE nationality = 'American';

-- Query 3
SELECT first_name, last_name
FROM actors
WHERE gender = 'M' AND date_of_birth > '1970-01-01';

-- Query 4
SELECT movie_name
FROM movies
WHERE movie_length > 90 AND movie_lang = 'English';

-- Part C
-- Query 1
SELECT movie_name, movie_lang
FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');

-- Query 2
SELECT first_name, last_name
FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';

-- Query 3
SELECT first_name, last_name
FROM directors
WHERE nationality IN ('British', 'French', 'German')
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';