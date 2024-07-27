SELECT p.id AS "ID", p.first_name AS "First name", p.last_name AS "Last name", SUM(m.budget) AS "Total movies budget"
FROM person p
         LEFT JOIN actor_movie am ON p.id = am.person_id
         LEFT JOIN movie m ON am.movie_id = m.id
GROUP BY p.id, p.first_name, p.last_name;
