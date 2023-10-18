-- 1. Create database called «lab1»
CREATE DATABASE lab1;
--Batyrkhan

-- 3. Create table «users» with the specified fields
CREATE TABLE users (
    id serial PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

-- 4. Add integer column (0 or 1) «isadmin» to «users» table
ALTER TABLE users ADD COLUMN isadmin INTEGER;

-- 5. Change type of «isadmin» column to boolean
ALTER TABLE users ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING (isadmin::BOOLEAN);

-- 6. Set default value as false to «isadmin» column
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

-- 7. Add primary key constraint to id column
ALTER TABLE users ADD CONSTRAINT pk_users_id PRIMARY KEY (id);

-- 8. Create table «tasks» with the specified fields
CREATE TABLE tasks (
    id serial PRIMARY KEY,
    name VARCHAR(50),
    user_id INTEGER
);

-- 9. Delete «tasks» table
DROP TABLE IF EXISTS tasks;

-- 10. Delete «lab1» database
\c postgres; -- Connect to the default PostgreSQL database
DROP DATABASE IF EXISTS lab1;
