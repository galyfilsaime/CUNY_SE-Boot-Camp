-- PART A
-- Query 1: Count Actors Born After 1970-01-01
SELECT COUNT(*) AS actor_count
FROM actors
WHERE date_of_birth > '1970-01-01';

-- Query 2: Highest and Lowest Domestic Takings
SELECT MAX(domestic_takings) AS highest_domestic,
       MIN(domestic_takings) AS lowest_domestic
FROM movie_revenues;

-- Query 3: Sum Total Movie Length for Age Certificate 15
SELECT SUM(movie_length) AS total_length
FROM movies
WHERE age_certificate = '15';

-- Query 4: Count Japanese Directors
SELECT COUNT(*) AS japanese_director_count
FROM directors
WHERE nationality = 'Japanese';

-- Query 5: Average Movie Length for Chinese Movies
SELECT AVG(movie_length) AS avg_length
FROM movies
WHERE movie_lang = 'Chinese';


-- PART B
-- Query 1: Directors per Nationality
SELECT nationality, COUNT(*) AS director_count
FROM directors
GROUP BY nationality;

-- Query 2: Sum Total Movie Length by Age Certificate and Language
SELECT age_certificate, movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY age_certificate, movie_lang;

-- Query 3: Movie Languages with Total Movie Length > 500 Minutes
SELECT movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;


-- PART C
-- Query 1: Actors in Wes Anderson’s Movies
SELECT DISTINCT a.first_name, a.last_name
FROM actors a
JOIN movies_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';

-- Query 2: Oldest Actors by Gender
SELECT first_name, last_name, date_of_birth
FROM actors
WHERE (gender, date_of_birth) IN (
    SELECT gender, MIN(date_of_birth)
    FROM actors
    GROUP BY gender
);

-- Query 3: Movies with Above-Average Length for Their Age Certificate
WITH avg_lengths AS (
    SELECT age_certificate, AVG(movie_length) AS avg_length
    FROM movies
    GROUP BY age_certificate
)
SELECT m.movie_name, m.movie_length, m.age_certificate
FROM movies m
JOIN avg_lengths al ON m.age_certificate = al.age_certificate
WHERE m.movie_length > al.avg_length;
