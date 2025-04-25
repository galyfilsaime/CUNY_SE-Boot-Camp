-- Create actors table
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE
);

-- Create directors table
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    nationality VARCHAR(50)
);

-- Create movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    movie_length INT,
    movie_lang VARCHAR(50),
    release_date DATE,
    age_certificate VARCHAR(10),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- Create movie_revenues table
CREATE TABLE movie_revenues (
    revenue_id INT PRIMARY KEY,
    movie_id INT,
    domestic_takings DECIMAL(10,1),
    international_takings DECIMAL(10,1),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Create movies_actors junction table
CREATE TABLE movies_actors (
    actor_id INT,
    movie_id INT,
    PRIMARY KEY (actor_id, movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);