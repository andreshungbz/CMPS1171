-- PART A

-- 1
DROP DATABASE IF EXISTS music;
CREATE DATABASE music;

DROP ROLE IF EXISTS music;
CREATE ROLE music
WITH LOGIN PASSWORD 'music';

-- execute this after connecting to music database and commenting the above
-- 2
DROP TABLE IF EXISTS album CASCADE;
CREATE TABLE album (
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL);

-- 3, 4
DROP TABLE IF EXISTS track;
CREATE TABLE track (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    len INTEGER NOT NULL
);

-- 4
ALTER TABLE track
ADD COLUMN album_id INTEGER REFERENCES album(id) ON DELETE CASCADE;

-- 5
INSERT INTO album (title)
VALUES
('Queen of The Night'),
('Jiminy'),
('Waterfall');

INSERT INTO track (title, len, album_id)
VALUES
('Babylon', 4, 1),
('Downpour', 3, 1),
('Bark Skinpson', 2, 2),
('Vulture', 7, 2),
('Rule #18 - Lion', 3, 3);

-- 6
SELECT A.title AS album_title, T.title AS track_title, T.len
FROM album AS A
INNER JOIN track AS T
ON A.id = T.album_id;
