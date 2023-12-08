SELECT title, rating FROM
(SELECT m.title, r.rating, m.id AS movie_id FROM movies m, ratings r
WHERE m.id = r.movie_id AND m.year = 2010) AS movie_ratings
ORDER BY rating DESC, title ASC;
