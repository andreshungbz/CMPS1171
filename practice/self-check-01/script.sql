-- create databases

DROP DATABASE IF EXISTS zoo;
DROP DATABASE IF EXISTS library;
DROP DATABASE IF EXISTS school;
DROP DATABASE IF EXISTS transportation;
DROP DATABASE IF EXISTS gym;
DROP DATABASE IF EXISTS bank;

CREATE DATABASE zoo;
CREATE DATABASE library;
CREATE DATABASE school;
CREATE DATABASE transportation;
CREATE DATABASE gym;
CREATE DATABASE bank;

-- create roles

DROP ROLE IF EXISTS zookeeper;
DROP ROLE IF EXISTS librarian;
DROP ROLE IF EXISTS teacher;
DROP ROLE IF EXISTS conductor;
DROP ROLE IF EXISTS trainer;
DROP ROLE IF EXISTS teller;

CREATE ROLE zookeeper
WITH
    LOGIN PASSWORD 'zookeeper';

CREATE ROLE librarian
WITH
    LOGIN PASSWORD 'librarian';

CREATE ROLE teacher
WITH
    LOGIN PASSWORD 'teacher';

CREATE ROLE conductor
WITH
    LOGIN PASSWORD 'conductor';

CREATE ROLE trainer
WITH
    LOGIN PASSWORD 'trainer';

CREATE ROLE teller
WITH
    LOGIN PASSWORD 'teller';

-- install citext extension and grant privileges to roles (psql 15/16)

\c zoo;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO zookeeper;

\c library;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO librarian;

\c school;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO teacher;

\c transportation;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO conductor;

\c gym;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO trainer;

\c bank;
CREATE EXTENSION IF NOT EXISTS citext;
GRANT ALL PRIVILEGES ON SCHEMA public TO teller;

-- extra tasks

DROP DATABASE gym;
ALTER ROLE zookeeper PASSWORD 'zoo';

-- database connections

\c zoo zookeeper;
\c library librarian;
\c school teacher;
\c transportation conductor;
\c bank teller;