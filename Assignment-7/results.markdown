# SE Boot Camp Assignment 7: SQL Queries and Results

This repository contains the SQL queries and results for Assignment 7 of the SE Boot Camp, using a PostgreSQL database (`se_bootcamp`). The database includes tables: `actors`, `directors`, `movies`, `movie_revenues`, and `movies_actors`. The `movie_id` column in the `movies` table is manually set (using `INT`, not `SERIAL`).

## Part A: Table Counts

**Query**:
```sql
SELECT COUNT(*) FROM actors
UNION ALL
SELECT COUNT(*) FROM directors
UNION ALL
SELECT COUNT(*) FROM movies
UNION ALL
SELECT COUNT(*) FROM movie_revenues
UNION ALL
SELECT COUNT(*) FROM movies_actors;
```

**Results**:
```
 count
-------
   147
    37
    53
    53
   181
```

## Part B

### Query 1: Movie Names and Release Dates
**Query**:
```sql
SELECT movie_name, release_date
FROM movies;
```

**Results** (53 rows, first 5 shown):
```
                 movie_name                 | release_date 
--------------------------------------------+--------------
 A Clockwork Or-ange                        | 1972-02-02
 Apocalypse Now                             | 1979-08-15
 Battle Royale                              | 2001-01-04
 Blade Runner                               | 1982-06-25
 Chungking Express                          | 1996-08-03
 City of God                                | 2003-01-17
 City of Men                                | 2008-02-29
 Cold Fish                                  | 2010-09-12
 Crouching Tiger Hidden Dragon              | 2000-07-06
 Eyes Wide Shut                             | 1999-07-16
 Forrest Gump                               | 1994-07-06
 Gladiator                                  | 2000-05-05
 Gone with the Wind                         | 1939-12-15
 Goodfellas                                 | 1990-09-19
 Grand Budapest Hotel                       | 2014-07-03
 House of Flying Daggers                    | 2004-03-12
 In the Mood for Love                       | 2001-02-02
 Jaws                                       | 1975-06-20
 Leon                                       | 1994-11-18
 Let the Right One In                       | 2008-10-24
 Life of Brian                              | 1979-08-17
 Life of Pi                                 | 2012-11-21
 Mary Poppins                               | 1964-08-29
 Never Let Me Go                            | 2010-09-15
 Oldboy                                     | 2005-03-25
 Pans Labyrinth                             | 2006-12-29
 Ponyo                                      | 2009-08-14
 Pulp Fiction                               | 1994-10-14
 Raging Bull                                | 1980-11-14
 Rushmore                                   | 1998-11-12
 Spider-Man                                 | 2002-05-03
 Spider-Man 2                               | 2004-06-30
 Spider-Man 3                               | 2007-05-04
 Spirited Away                              | 2001-06-19
 Star Wars: A New Hope                      | 1977-05-25
 Star Wars: Empire Strikes Back             | 1980-05-21
 Star Wars: Return of the Jedi              | 1983-05-25
 Submarine                                  | 2011-06-03
 Taxi Driver                                | 1976-02-07
 The Darjeeling Limited                     | 2007-09-29
 The Fifth Element                          | 1997-05-09
 The Lives of Others                        | 2007-02-09
 The Shining                                | 1980-05-23
 The Sound of Music                         | 1965-03-02
 The Wizard of Oz                           | 1939-08-25
 There Will Be Blood                        | 2007-12-26
 Three Billboards Outside Ebbing, Missouri  | 2017-11-10
 Titanic                                    | 1997-12-19
 Top Gun                                    | 1986-05-16
 Toy Story                                  | 1995-11-22
 V for Vendetta                             | 2006-03-17
 Watchmen                                   | 2009-03-06
 Way of the Dragon                          | 1972-06-01
```

### Query 2: American Directors
**Query**:
```sql
SELECT first_name, last_name
FROM directors
WHERE nationality = 'American';
```

**Results** (16 rows):
```
first_name |  last_name   
------------+--------------
 Paul       | Anderson
 Wes        | Anderson
 James      | Cameron
 Victor     | Fleming
 Francis    | Ford Coppola
 Stanley    | Kubrick
 John       | Lasseter
 George     | Lucas
 Sam        | Raimi
 Mark       | Romanek
 Martin     | Scorsese
 Zack       | Snyder
 Steven     | Spielberg
 Quentin    | Tarantino
 Robert     | Wise
 Robert     | Zemeckis
```

### Query 3: Male Actors Born After 1970
**Query**:
```sql
SELECT first_name, last_name
FROM actors
WHERE gender = 'M' AND date_of_birth > '1970-01-01';
```

**Results** (31 rows):
```
 first_name |  last_name   
------------+--------------
 Adrien     | Brody
 Chen       | Chang
 Paddy      | Considine
 Darlan     | Cunha
 Paul       | Dano
 Leonardo   | DiCaprio
 Hiroki     | Doi
 Leandro    | Firmino
 James      | Franco
 Dillon     | Freasier
 Tatsuya    | Fujiwara
 Mason      | Gamble
 Andrew     | Garfield
 Kare       | Hedebrant
 Miyu       | Irino
 Takeshi    | Kaneshiro
 Jude       | Law
 Danny      | Lloyd
 Tobey      | Maguire
 Joaquin    | Phoenix
 Tony       | Revolori
 Craig      | Roberts
 Alexandre  | Rodrigues
 Jason      | Schwartzmann
 Suraj      | Sharma
 Douglas    | Silva
 Rafe       | Spall
 Chris      | Tucker
 Luke       | Wilson
 Patrick    | Wilson
 Ji-tae     | Yoo
```

### Query 4: English Movies Over 90 Minutes
**Query**:
```sql
SELECT movie_name
FROM movies
WHERE movie_length > 90 AND movie_lang = 'English';
```

**Results** (37 rows):
```
 movie_name
-------------------
A Clockwork Or-ange
 Apocalypse Now
 Blade Runner 
 Eyes Wide Shut
 Forrest Gump
 Gladiator
 Gone with the Wind
 Goodfellas
 Grand Budapest Hotel
 Jaws
 Leon
 Life of Brian
 Life of Pi
 Never Let Me Go
 Pulp Fiction
 Raging Bull
 Rushmore
 Spider-Man
 Spider-Man 2
 Spider-Man 3
 Star Wars: A New Hope
 Star Wars: Empire Strikes Back
 Star Wars: Return of the Jedi
 Submarine
 Taxi Driver
 The Darjeeling Limited
 The Fifth Element
 The Shining
 The Sound of Music
 The Wizard of Oz
 There Will Be Blood
 Three Billboards Outside Ebbing, Missouri 
 Titanic
 Top Gun
 Toy Story
 V for Vendetta
 Watchmen
```

## Part C

### Query 1: Movies in English, Spanish, or Korean
**Query**:
```sql
SELECT movie_name, movie_lang
FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');
```

**Results** (40 rows):
```
                 movie_name                 | movie_lang 
--------------------------------------------+------------
 A Clockwork Or-ange                        | English
 Apocalypse Now                             | English
 Blade Runner                               | English
 Eyes Wide Shut                             | English
 Forrest Gump                               | English
 Gladiator                                  | English
 Gone with the Wind                         | English
 Goodfellas                                 | English
 Grand Budapest Hotel                       | English
 Jaws                                       | English
 Leon                                       | English
 Life of Brian                              | English
 Life of Pi                                 | English
 Mary Poppins                               | English
 Never Let Me Go                            | English
 Oldboy                                     | Korean
 Pans Labyrinth                             | Spanish
 Pulp Fiction                               | English
 Raging Bull                                | English
 Rushmore                                   | English
 Spider-Man                                 | English
 Spider-Man 2                               | English
 Spider-Man 3                               | English
 Star Wars: A New Hope                      | English
 Star Wars: Empire Strikes Back             | English
 Star Wars: Return of the Jedi              | English
 Submarine                                  | English
 Taxi Driver                                | English
 The Darjeeling Limited                     | English
 The Fifth Element                          | English
 The Shining                                | English
 The Sound of Music                         | English
 The Wizard of Oz                           | English
 There Will Be Blood                        | English
 Three Billboards Outside Ebbing, Missouri  | English
 Titanic                                    | English
 Top Gun                                    | English
 Toy Story                                  | English
 V for Vendetta                             | English
 Watchmen                                   | English
```

### Query 2: Actors with Last Name Starting with 'M', Born 1940–1969
**Query**:
```sql
SELECT first_name, last_name
FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';
```

**Results** (6 rows):
```
 first_name | last_name
------------+-----------
 Malcolm    | McDowell
 Alfred     | Molina
 Francis    | McDormand
 Bill       | Murray
 Tobey      | Maguire
 Sihung     | Lung
```

### Query 3: British/French/German Directors Born 1950–1980
**Query**:
```sql
SELECT first_name, last_name
FROM directors
WHERE nationality IN ('British', 'French', 'German')
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';
```

**Results** (4 rows):
```
 first_name | last_name
------------+-----------
 Richard    | Ayoade
 Luc        | Besson
 Florian    | Henckel von Donnersmarck
 Martin     | McDonagh
```