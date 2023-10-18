--lab3

--1
CREATE DATABASE lab3;

--2
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);




--3
SELECT lastname FROM employees;

--4
SELECT DISTINCT lastname FROM employees;

--5
SELECT * FROM employees WHERE lastname = 'Smith';

--6
SELECT * FROM employees WHERE lastname IN ('Smith', 'Doe');

--7
SELECT * FROM employees WHERE department = 14;

--8
SELECT * FROM employees WHERE department IN (37, 77);

--9
SELECT SUM(budget) FROM departments;

--10
SELECT ssn,department, COUNT(*) AS num_employees
FROM employees
GROUP BY department,ssn;

--11
SELECT department
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

--12
SELECT name
FROM departments
ORDER BY budget DESC
LIMIT 1 OFFSET 1;

-- 13
WITH min_budget AS (SELECT MIN(budget) AS min_budget FROM departments)
SELECT e.name, e.lastname
FROM employees e
JOIN departments d ON e.department = d.code
WHERE d.budget = (SELECT min_budget FROM min_budget);

-- 14
SELECT name, lastname FROM employees WHERE city = 'Almaty'
UNION
SELECT name, lastname FROM customers WHERE city = 'Almaty';

-- 15
SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;

-- 16
UPDATE departments
SET budget = budget * 0.90
WHERE code = (SELECT code FROM departments ORDER BY budget ASC LIMIT 1);

-- 17
UPDATE employees
SET department = (SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Research');

-- 18
DELETE FROM employees WHERE department = (SELECT code FROM departments WHERE name = 'IT');

-- 19
DELETE  FROM employees;




