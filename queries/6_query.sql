SELECT m.id                            AS "ID",
       m.title                         AS "Title",
       m.release_date                  AS "Release date",
       m.duration                      AS "Duration",
       m.description                   AS "Description",
       JSON_BUILD_OBJECT(
               'file_id', f.id,
               'file_name', f.file_name,
               'mime_type', f.mime_type,
               'key', f.key,
               'url', f.url
       )                               AS "Poster",
       JSON_BUILD_OBJECT(
               'person_id', p.id,
               'first_name', p.first_name,
               'last_name', p.last_name,
               'photo', JSON_BUILD_OBJECT(
                       'file_id', dp.id,
                       'file_name', dp.file_name,
                       'mime_type', dp.mime_type,
                       'key', dp."key",
                       'url', dp.url)) AS "Director",
       JSON_AGG(JSON_BUILD_OBJECT('person_id', a.id,
                                  'first_name', a.first_name,
                                  'last_name', a.last_name,
                                  'photo', JSON_BUILD_OBJECT(
                                          'file_id', ap.id,
                                          'file_name', ap.file_name,
                                          'mime_type', ap.mime_type,
                                          'key', ap."key",
                                          'url', ap.url)
                ))                     AS "Actors",
       JSON_AGG(JSON_BUILD_OBJECT(
               'genre_id', g.id,
               'name', g.title))       AS "Genres"
FROM movie m
         JOIN file f ON m.poster_id = f.id
         JOIN person p ON m.director_id = p.id
         JOIN file dp ON p.main_photo_id = dp.id
         LEFT JOIN character c ON m.id = c.movie_id
         LEFT JOIN person a ON c.person_id = a.id
         LEFT JOIN file ap ON a.main_photo_id = ap.id
         JOIN movie_genre mg ON m.id = mg.movie_id
         JOIN genre g ON mg.genre_id = g.id
WHERE m.id = 1
GROUP BY m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.mime_type, f.key, f.url,
         p.id, p.first_name, p.last_name, dp.id, dp.file_name, dp.mime_type, dp.key, dp.url;
