BEGIN;

CREATE TABLE genre
(
    id        SERIAL PRIMARY KEY,
    title     VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE file
(
    id        SERIAL PRIMARY KEY,
    file_name VARCHAR(100)        NOT NULL,
    mime_type VARCHAR(50),
    key       VARCHAR(100) UNIQUE NOT NULL,
    url       TEXT                NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE country
(
    id           SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_table
(
    id         SERIAL PRIMARY KEY,
    username   VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(100)        NOT NULL,
    last_name  VARCHAR(100)        NOT NULL,
    email      VARCHAR(100) UNIQUE NOT NULL,
    password   VARCHAR(100)        NOT NULL,
    avatar_id  INT,
    createdAt  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (avatar_id) REFERENCES file (id)
);

CREATE TABLE person
(
    id            SERIAL PRIMARY KEY,
    first_name    VARCHAR(100) NOT NULL,
    last_name     VARCHAR(100) NOT NULL,
    biography     TEXT,
    birth_date    DATE,
    gender        VARCHAR(10)  NOT NULL,
    country_id    INT,
    main_photo_id INT,
    createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES country (id),
    FOREIGN KEY (main_photo_id) REFERENCES file (id)
);

CREATE TABLE person_photos
(
    id        SERIAL PRIMARY KEY,
    person_id INT NOT NULL,
    photo_id  INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES person (id),
    FOREIGN KEY (photo_id) REFERENCES file (id)
);

CREATE TABLE movie
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    budget       INT,
    release_date DATE,
    duration     INT,
    director_id  INT,
    country_id   INT,
    poster_id    INT,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (director_id) REFERENCES person (id),
    FOREIGN KEY (country_id) REFERENCES country (id),
    FOREIGN KEY (poster_id) REFERENCES file (id)
);

CREATE TABLE movie_genre
(
    movie_id  INT NOT NULL,
    genre_id  INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE TABLE actor_movie
(
    id               SERIAL PRIMARY KEY,
    movie_id         INT,
    person_id        INT,
    role_description TEXT,
    createdAt        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (person_id) REFERENCES person (id)
);

CREATE TABLE character
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    role        VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
    movie_id    INT,
    person_id   INT          NULL,
    createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movie (id),
    FOREIGN KEY (person_id) REFERENCES person (id)
);

CREATE TABLE favorite
(
    user_id   INT NOT NULL,
    movie_id  INT NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_table (id),
    FOREIGN KEY (movie_id) REFERENCES movie (id)
);


COMMIT;

