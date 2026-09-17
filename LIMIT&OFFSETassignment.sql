-- Create a database named "moviedb" and inside it create a table named "movies" with the following columns: movie_id as an auto-incrementing integer and unique row identifier, title as text up to 150 characters that cannot be empty, genre as text up to 60 characters, director as text up to 100 characters, release_year as a whole number, language as text up to 50 characters, rating as a decimal with 4 digits total and 1 decimal place, box_office_crore as a decimal with 10 digits total and 2 decimal places, duration_minutes as a whole number.
CREATE DATABASE IF NOT EXISTS moviedb;
USE moviedb;

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(60),
    director VARCHAR(100),
    release_year INT,
    language VARCHAR(50),
    rating DECIMAL(4,1),
    box_office_crore DECIMAL(10,2),
    duration_minutes INT
);

INSERT INTO movies
(title, genre, director, release_year, language, rating, box_office_crore, duration_minutes)
VALUES
('Dangal', 'Drama', 'Nitesh Tiwari', 2016, 'Hindi', 8.4, 2024.00, 161),
('Baahubali', 'Action', 'S. S. Rajamouli', 2015, 'Telugu', 8.1, 650.00, 158),
('3 Idiots', 'Comedy', 'Rajkumar Hirani', 2009, 'Hindi', 8.4, 460.00, 170),
('PK', 'Comedy', 'Rajkumar Hirani', 2014, 'Hindi', 8.1, 769.00, 153),
('Tumbbad', 'Horror', 'Rahi Anil Barve', 2018, 'Hindi', 8.2, 13.00, 104),
('Andhadhun', 'Thriller', 'Sriram Raghavan', 2018, 'Hindi', 8.2, 456.00, 139),
('Drishyam', 'Thriller', 'Nishikant Kamat', 2015, 'Hindi', 8.2, 124.00, 163),
('Uri', 'Action', 'Aditya Dhar', 2019, 'Hindi', 8.2, 342.00, 138),
('Gully Boy', 'Drama', 'Zoya Akhtar', 2019, 'Hindi', 7.9, 237.00, 154),
('Super 30', 'Drama', 'Vikas Bahl', 2019, 'Hindi', 7.4, 200.00, 155),
('Lagaan', 'Drama', 'Ashutosh Gowariker', 2001, 'Hindi', 8.1, 65.00, 224),
('Swades', 'Drama', 'Ashutosh Gowariker', 2004, 'Hindi', 8.2, 11.00, 189),
('Rang De Basanti', 'Drama', 'Rakeysh Mehra', 2006, 'Hindi', 8.1, 127.00, 157),
('Kahaani', 'Thriller', 'Sujoy Ghosh', 2012, 'Hindi', 8.1, 102.00, 122),
('Queen', 'Drama', 'Vikas Bahl', 2014, 'Hindi', 8.2, 103.00, 116),
('Lootera', 'Drama', 'Vikramaditya Motwane', 2013, 'Hindi', 7.9, 23.00, 115),
('Newton', 'Drama', 'Amit Masurkar', 2017, 'Hindi', 7.5, 21.00, 106),
('Masaan', 'Drama', 'Neeraj Ghaywan', 2015, 'Hindi', 8.2, 5.00, 109),
('Pink', 'Thriller', 'Aniruddha Roy', 2016, 'Hindi', 8.1, 113.00, 136),
('Article 15', 'Drama', 'Anubhav Sinha', 2019, 'Hindi', 8.1, 65.00, 130),
('Talaash', 'Thriller', 'Reema Kagti', 2012, 'Hindi', 7.7, 146.00, 140),
('Udta Punjab', 'Drama', 'Abhishek Chaubey', 2016, 'Hindi', 7.8, 63.00, 148),
('A Wednesday', 'Thriller', 'Neeraj Pandey', 2008, 'Hindi', 8.2, 32.00, 104),
('Trapped', 'Thriller', 'Vikramaditya Motwane', 2017, 'Hindi', 7.8, 2.00, 105),
('Bard of Blood', 'Thriller', 'Ribhu Dasgupta', 2019, 'Hindi', 7.1, 0.00, 55);

select * from movies;

-- 3.Display only the first 5 movies from the table without any particular ordering to see a quick sample of the data.
SELECT * FROM movies LIMIT 5;

-- 4.Display the top 5 highest rated movies showing only the title and rating columns.
SELECT
rating,
title
FROM movies
ORDER BY rating DESC
LIMIT 5;

-- 5.Display the single movie with the highest box office collection, showing its title and collection.
SELECT 
title,
box_office_crore
FROM movies
order by box_office_crore DESC
limit 1;

-- 6.Display the 3 movies with the shortest duration, showing title and duration.
SELECT title, duration_minutes
FROM movies
ORDER BY duration_minutes ASC
LIMIT 3;

-- 7.Display the single most recent movie by release year, showing title and year.
SELECT
title, release_year
from movies
order by release_year DESC
LIMIT 1;

-- 8.Display the oldest movie in the table by release year.alter
SELECT
title , release_year
from movies
order by release_year ASC
LIMIT 1;

-- 9.Display movies from position 6 to 10 (the second set of 5) ordered by movie_id, simulating page 2 with a page size of 5.
SELECT *
from movies
order by movie_id
LIMIT 5 offset 5;

-- 10.Display movies from position 11 to 15 (the third set of 5) ordered by movie_id, simulating page 3.
SELECT *
FROM movies
ORDER BY movie_id
LIMIT 5 OFFSET 10;

-- 11.Display movies from position 16 to 20 ordered by movie_id.alter
SELECT *
FROM movies
ORDER BY movie_id
LIMIT 5 OFFSET 15;

-- 12.Display movies from position 21 to 25 ordered by movie_id.
SELECT *
FROM movies
ORDER BY movie_id
LIMIT 20 OFFSET 20;

-- 13.Calculate how many total pages would exist if you showed 5 movies per page and display that count.
SELECT 
(COUNT(*) / 5) AS total_pages
FROM movies;

-- 14.Calculate how many total pages would exist with a page size of 8 movies per page.
SELECT 
(COUNT(*) / 8) AS total_pages
FROM movies;

-- 15.Display the top 5 Drama genre movies by rating, showing title, genre, and rating.
SELECT
title,
genre,
rating
from movies
where genre = 'drama'
order by rating DESC
LIMIT 5;

-- 16.Display the second highest rated movie (only one row, the movie with the second highest distinct rating value).

 SELECT title, rating
FROM movies
WHERE rating = (
    SELECT DISTINCT rating
    FROM movies
    ORDER BY rating DESC
    LIMIT 1 OFFSET 1
);

-- 17.Display the third highest box office collection, showing title and collection amount.
SELECT title,   box_office_crore
FROM movies
WHERE box_office_crore=(
SELECT DISTINCT box_office_crore
FROM movies
order by box_office_crore DESC
LIMIT 1 OFFSET 2);

-- 18.Display the 5 movies with the longest duration, sorted from longest to shortest, showing title and duration.
SELECT title, duration_minutes
from movies
order by duration_minutes DESC
LIMIT 5;


-- 19.Display only Thriller genre movies, sorted by rating descending, and show only the first 4.
SELECT *
from movies
where genre = 'Thriller'
order by rating DESC
LIMIT 4;

-- 20.Display the 5 lowest earning movies by box office collection showing title and earnings.
SELECT title, box_office_crore
FROM movies
ORDER BY box_office_crore ASC
LIMIT 5;

-- 21.Display movies released between 2015 and 2019, sorted by box office descending, and return only the top 3 from this filtered and sorted result.
SELECT * FROM movies
WHERE release_year BETWEEN 2015 AND 2019
ORDER BY box_office_crore DESC
LIMIT 3;

-- 22.Display all movies sorted by rating descending, and using offset-based retrieval show only the movies that would appear on page 3 if each page held 6 movies.
SELECT * FROM movies
order by rating DESC
LIMIT 6 offset 12;

-- 23.Display the director who has directed the movie with the highest box office collection, showing only one row with director name and collection.
SELECT director, box_office_crore
from movies
order by box_office_crore DESC
LIMIT 1;

-- 24.Display 5 movies per page sorted by release_year ascending and show the correct page for page number 4.
SELECT * FROM movies
ORDER BY release_year ASC
LIMIT 5 offset 15;

-- 25.Display a query that returns the movies on the last page assuming 5 movies per page and you know the total is 25 movies, so the last page starts at row 21.
SELECT *
FROM movies
ORDER BY movie_id
LIMIT 5 OFFSET 20;

-- 26.Display the top 3 movies by box office collection for only movies released after 2015.
SELECT title, box_office_crore
FROM movies
WHERE release_year > 2015
ORDER BY box_office_crore DESC
LIMIT 3;

-- 27.Using keyset-style logic, display the next 5 movies after the movie with movie_id 10, ordered by movie_id ascending, without using offset.
SELECT * FROM movies
where movie_id > 10
order by movie_id ASC
LIMIT 5;

-- 28.Display all Horror and Thriller genre movies sorted by rating descending and return only the top 3 from this combined filtered result.
SELECT *
FROM movies
WHERE genre IN ('Horror', 'Thriller')
ORDER BY rating DESC
LIMIT 3;

-- 29.Display movies sorted by box_office_crore descending and show only movies that fall in positions 4 through 8 of this sorted list (the second batch of 5 after skipping the top 3).

SELECT * FROM movies
order by box_office_crore DESC
LIMIT 5 offset 3;

-- 30.Write a complete paginated browsing simulation: display the total number of movies, the total number of pages at 5 per page, and then display what page 2 looks like when movies are sorted by rating descending with a page size of 5 movies.

SELECT count(*) AS total_movies
from movies;
SELECT (COUNT(*) / 5) AS total_pages
FROM movies;
SELECT *
FROM movies
ORDER BY rating DESC
LIMIT 5 OFFSET 5;
