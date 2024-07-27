BEGIN;

INSERT INTO genre (title, createdAt, updatedAt)
VALUES ('Action', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Drama', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Fantasy', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Romance', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Horror', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO file (file_name, mime_type, key, url, createdAt, updatedAt)
VALUES ('photo1.png', 'image/png', 'photo1.png', 'https://somehost.com/photo1.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('photo2.png', 'image/png', 'photo2.png', 'https://somehost.com/photo2.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('photo3.png', 'image/png', 'photo3.png', 'https://somehost.com/photo3.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('photo4.png', 'image/png', 'photo4.png', 'https://somehost.com/photo4.png', CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO country (country_name, createdAt, updatedAt)
VALUES ('Ukraine', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('USA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('UK', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Germany', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Italy', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO user_table (username, first_name, last_name, email, password, avatar_id, createdAt, updatedAt)
VALUES ('Username1', 'Firstname1', 'Lastname1', 'email1@gmail.com', '123', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Username2', 'Firstname2', 'Lastname2', 'email2@gmail.com', '123', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Username3', 'Firstname3', 'Lastname3', 'email3@gmail.com', '123', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO person (first_name, last_name, biography, birth_date, gender, country_id, main_photo_id,
                    createdAt, updatedAt)
VALUES ('Firstname1', 'Lastname1', 'Something about person biography 1', '2000-01-20', 'Male', 1, 1, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('Firstname2', 'Lastname2', 'Something about person biography 2', '2000-02-20', 'Male', 2, 2, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('Firstname3', 'Lastname3', 'Something about person biography 3', '2000-03-20', 'Female', 3, 3,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO person_photos (person_id, photo_id, createdAt, updatedAt)
VALUES (1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO movie (title, description, budget, release_date, duration, director_id, country_id, poster_id,
                   createdAt, updatedAt)
VALUES ('Movie title 1', 'Some big large movie description 1.', 15000000, '1995-01-01', 100, 1, 1, 1, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('Movie title 11', 'Some big large movie description 11.', 15000000, '2022-01-01', 140, 1, 1, 1,
        CURRENT_TIMESTAMP),
       ('Movie title 2', 'Some big large movie description 2.', 20000000, '2023-01-01', 120, 2, 2, 2, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('Movie title 3', 'Some big large movie description 3.', 50000000, '2023-01-01', 120, 2, 2, 2, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP),
       ('Movie title 4', 'Some big large movie description 4.', 25000000, '1996-01-01', 130, 3, 3, 3, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO movie_genre (movie_id, genre_id, createdAt, updatedAt)
VALUES (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO actor_movie (movie_id, person_id, role_description, createdAt, updatedAt)
VALUES (1, 1, 'Some role description 1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, null, 'Some role description 2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (1, 3, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (3, 3, null, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO character (name, description, role, movie_id, person_id, createdAt, updatedAt)
VALUES ('Character name 1', 'Character description 1.', 'leading', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Character name 2', 'Character description 2.', 'leading', 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       ('Character name 3', 'Character description, supporting character.', 'supporting', 2, null, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP);

INSERT INTO favorite (user_id, movie_id, createdAt, updatedAt)
VALUES (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
       (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


COMMIT;
