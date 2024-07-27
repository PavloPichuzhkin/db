SELECT u.id                  AS "ID",
       u.username            AS "Username",
       ARRAY_AGG(f.movie_id) AS "Favorite movie IDs"
FROM user_table u
         LEFT JOIN favorite f ON u.id = f.user_id
GROUP BY u.id, u.username;
