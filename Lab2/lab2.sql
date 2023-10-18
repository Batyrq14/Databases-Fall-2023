
CREATE DATABASE lab2;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INTEGER,
    population INTEGER
);

INSERT INTO countries (country_name, region_id, population) 
VALUES ('Kazakhstan', 1, 18776707);


INSERT INTO countries (country_id, country_name)
VALUES (2, 'Canada');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Australia', NULL, 25000000);


INSERT INTO countries (country_name, region_id, population)
VALUES ('Germany', 2, 83000000),
       ('France', 2, 67000000),
       ('Japan', 3, 126500000);


ALTER TABLE countries 
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';


INSERT INTO countries (country_id) 
VALUES (5);


INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);


INSERT INTO countries_new 
SELECT * FROM countries;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;


SELECT country_name, population * 1.1 AS "New Population" 
FROM countries;


DELETE FROM countries WHERE population < 100000;


DELETE FROM countries_new WHERE country_id IN (SELECT country_id FROM countries);

DELETE FROM countries;