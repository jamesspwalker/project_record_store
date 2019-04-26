DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE albums
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  artist_id INT8 references artists(id)
);
