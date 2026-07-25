CREATE DATABASE IF NOT EXISTS MY_DATABASE;
USE MY_DATABASE;


DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

SELECT DATABASE();
CREATE TABLE users (
user_id INT auto_increment KEY,
name VARCHAR(100),
email VARCHAR(100)
);

USE MY_DATABASE;
SELECT DATABASE();
CREATE TABLE movies (
movie_id INT PRIMARY KEY,
title VARCHAR(100),
genre VARCHAR(100),
release_year INT
);
USE MY_DATABASE;
SELECT DATABASE();
CREATE TABLE ratings (
rating_id INT PRIMARY KEY,
user_id INT(100),
movie_id INT(100),
rating DECIMAL(2,1),
FOREIGN KEY(user_id)REFERENCES users(user_id),
FOREIGN KEY(movie_id)REFERENCES movies(movie_id)
);

INSERT INTO users(name,email) VALUES
('AMAN','aman@gmail.com'),
( 'Anamika' , 'anamika@gmail.com'),
( 'Anshita' , 'anshita@gmail.com');

SELECT*FROM users;

INSERT INTO  movies VALUES 
(104, 'avengers','action',2019),
(105, 'batmaan','actiion',2022),
(106, 'conjuring', 'horror',2013),
(107, 'inception','sci-fi',2010),
(108, 'spider-man','action',2021);

SELECT*FROM movies;

INSERT INTO ratings VALUES
(1, 1, 104, 5.0),
(2, 1, 105, 4.0),

(3, 2, 104, 5.0),
(4, 2, 105, 4.0),
(5, 2, 106, 5.0),

(6, 3, 107, 5.0),
(7, 3, 108, 4.5);

SELECT*FROM ratings;

SELECT m.title, AVG(r.rating) AS avg_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY avg_rating DESC;

SELECT m.title, r.rating
FROM ratings r
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.user_id = 1;

SELECT DISTINCT m.title
FROM ratings r1
JOIN ratings r2 ON r1.movie_id = r2.movie_id
JOIN movies m ON m.movie_id = r2.movie_id
WHERE r1.user_id = 1
  AND r2.user_id != 1
  AND r2.rating >= 4;
  
  SELECT m2.title
FROM movies m1
JOIN movies m2 ON m1.genre = m2.genre
WHERE m1.movie_id = 1
  AND m2.movie_id != 1;
  
  DROP VIEW IF EXISTS top_movies;
  CREATE VIEW top_movies AS
SELECT movie_id, AVG(rating) AS avg_rating
FROM ratings
GROUP BY movie_id;
  
  SELECT * FROM top_movies;
  
  
  CREATE INDEX idx_rattig_user ON ratings(user_id);
  SHOW INDEX FROM ratings;
  


















 
 
 


  



