SELECT m.id                AS "ID",
       m.title             AS "Title",
       COUNT(am.person_id) AS "Actors count"
FROM movie m
         LEFT JOIN actor_movie am ON m.id = am.movie_id
WHERE m.release_date <= CURRENT_DATE - INTERVAL '5' year
GROUP BY m.id, m.title;
