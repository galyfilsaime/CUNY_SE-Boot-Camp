# SE Boot Camp Assignment 8: SQL Queries and Results

This repository contains the SQL queries and results for Assignment 8 of the SE Boot Camp, using a PostgreSQL database (`movies_db`). The database includes tables: `actors`, `directors`, `movies`, `movie_revenues`, and `movies_actors`. The `movie_id` column in `movies` is manually set (using `INT`, not `SERIAL`).

## Part A

### Query 1: Count Actors Born After 1970-01-01
**Query**:
```sql
SELECT COUNT(*) AS actor_count
FROM actors
WHERE date_of_birth > '1970-01-01';
```

**Result**:
```
 actor_count
-------------
          55
```

### Query 2: Highest and Lowest Domestic Takings
**Query**:
```sql
SELECT MAX(domestic_takings) AS highest_domestic,
       MIN(domestic_takings) AS lowest_domestic
FROM movie_revenues;
```

**Result**:
```
 highest_domestic | lowest_domestic
-----------------+----------------
           659.2 |            0.3
```

### Query 3: Sum Total Movie Length for Age Certificate 15
**Query**:
```sql
SELECT SUM(movie_length) AS total_length
FROM movies
WHERE age_certificate = '15';
```

**Result**:
```
 total_length
--------------
         2184
```

### Query 4: Count Japanese Directors
**Query**:
```sql
SELECT COUNT(*) AS japanese_director_count
FROM directors
WHERE nationality = 'Japanese';
```

**Result**:
```
 japanese_director_count
------------------------
                      3
```

### Query 5: Average Movie Length for Chinese Movies
**Query**:
```sql
SELECT AVG(movie_length) AS avg_length
FROM movies
WHERE movie_lang = 'Chinese';
```

**Result**:
```
      avg_length
----------------------
 121.8000000000000000
```

## Part B

### Query 1: Directors per Nationality
**Query**:
```sql
SELECT nationality, COUNT(*) AS director_count
FROM directors
GROUP BY nationality;
```

**Result**:
```
 nationality  | director_count 
--------------+----------------
 Chinese      |              4
 American     |             16
 Japanese     |              3
 Australian   |              1
 German       |              1
 Mexican      |              1
 Brazilian    |              2
 French       |              1
 British      |              6
 Swedish      |              1
 South Korean |              1
```

### Query 2: Sum Total Movie Length by Age Certificate and Language
**Query**:
```sql
SELECT age_certificate, movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY age_certificate, movie_lang;
```

**Result**:
```
 age_certificate | movie_lang | total_length 
-----------------+------------+--------------
 15              | Swedish    |          128
 PG              | English    |         1364
 18              | Portuguese |          145
 PG              | Spanish    |           98
 18              | Korean     |          130
 18              | Japanese   |          219
 15              | Chinese    |          113
 15              | Portuguese |          140
 U               | English    |          393
 12              | English    |          929
 U               | Japanese   |          227
 18              | English    |          500
 15              | German     |          165
 12              | Chinese    |          496
 15              | English    |         1638
```

### Query 3: Movie Languages with Total Movie Length > 500 Minutes
**Query**:
```sql
SELECT movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;
```

**Result**:
```
 movie_lang | total_length 
------------+--------------
 Chinese    |          609
 English    |         4824
```

## Part C

### Query 1: Actors in Wes Anderson’s Movies
**Query**:
```sql
SELECT DISTINCT a.first_name, a.last_name
FROM actors a
JOIN movies_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';
```

**Result**:
```
 first_name |  last_name   
------------+--------------
 Adrien     | Brody
 Bill       | Murray
 Brian      | Cox
 Edward     | Norton
 Jason      | Schwartzmann
 Jeff       | Goldblum
 Jude       | Law
 Luke       | Wilson
 Mason      | Gamble
 Olivia     | Williams
 Owen       | Wilson
 Ralph      | Fiennes
 Saoirse    | Ronan
 Tilda      | Swinton
 Tony       | Revolori
 Willem     | Dafoe
```

### Query 2: Oldest Actors by Gender
**Query**:
```sql
SELECT first_name, last_name, date_of_birth
FROM actors
WHERE (gender, date_of_birth) IN (
    SELECT gender, MIN(date_of_birth)
    FROM actors
    GROUP BY gender
);
```

**Result**:
```
 first_name | last_name | date_of_birth 
------------+-----------+---------------
 Clark      | Gable     | 1901-02-01
 Vivien     | Leigh     | 1913-11-05
```

### Query 3: Movies with Above-Average Length for Age Certificate
**Query**:
```sql
WITH avg_lengths AS (
    SELECT age_certificate, AVG(movie_length) AS avg_length
    FROM movies
    GROUP BY age_certificate
)
SELECT m.movie_name, m.movie_length, m.age_certificate
FROM movies m
JOIN avg_lengths al ON m.age_certificate = al.age_certificate
WHERE m.movie_length > al.avg_length;
```

**Result**:
```
           movie_name           | movie_length | age_certificate 
--------------------------------+--------------+-----------------
 Apocalypse Now                 |          168 | 15
 City of God                    |          145 | 18
 City of Men                    |          140 | 15
 Crouching Tiger Hidden Dragon  |          139 | 12
 Eyes Wide Shut                 |          130 | 18
 Gladiator                      |          165 | 15
 Gone with the Wind             |          123 | PG
 Goodfellas                     |          148 | 15
 House of Flying Daggers        |          134 | 12
 Jaws                           |          134 | 12
 Life of Pi                     |          129 | PG
 Oldboy                         |          130 | 18
 Ponyo                          |          107 | U
 Raging Bull                    |          132 | 18
 Spirited Away                  |          120 | U
 Star Wars: A New Hope          |          123 | PG
 Star Wars: Empire Strikes Back |          150 | PG
 Star Wars: Return of the Jedi  |          139 | PG
 The Fifth Element              |          149 | 12
 The Lives of Others            |          165 | 15
 The Shining                    |          126 | 18
 The Wizard of Oz               |          120 | U
 There Will Be Blood            |          168 | 15
 Titanic                        |          143 | 12
 V for Vendetta                 |          140 | 12
 Watchmen                       |          138 | 12
```