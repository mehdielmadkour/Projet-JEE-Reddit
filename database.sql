DROP DATABASE IF EXISTS reddit_database;
CREATE DATABASE reddit_database;

SET @@global.time_zone = '+00:00';
SET @@session.time_zone = '+00:00';

CREATE USER 'dbadmin'@'*' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON reddit_database.* TO 'dbadmin'@'*';