-- bank database setup

DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;

DROP ROLE IF EXISTS bank;
CREATE USER bank PASSWORD 'cookies';

\c bank;
GRANT ALL PRIVILEGES ON SCHEMA public TO bank;