DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  stock INT8,
  rating INT8 check(rating >= 0 and rating <= 5) NOT NULL
);
