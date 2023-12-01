--1
create database lab8;

--2
create table salesman(
    salesman_id integer primary key,
    name varchar(250),
    city varchar(250),
    commission float
);

create table customers (
    customer_id integer primary key ,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade integer,
    salesman_id integer references salesman(salesman_id)
);

create table orders (
    ord_no integer,
    purch_amt integer,
    ord_date date,
    customer_id integer references customers(customer_id),
    salesman_id integer references salesman(salesman_id)
);


INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman (salesman_id, name, commission) VALUES (5003, 'Lauson Hen', 0.12);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers (customer_id, cust_name, city, salesman_id) VALUES (3001, 'Brad Guzan', 'London',  5005);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES (3008, 'Julian Green', 'London', 300, 5002);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.5, '2012-10-05', 3005, 5002);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70009, 270.65, '2012-09-10', 3001, 5005);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70002, 65.26, '2012-10-05', 3002, 5001);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70004, 110.5, '2012-08-17', 3009, 5003);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70007, 948.5, '2012-09-10', 3005, 5002);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70005, 2400.6, '2012-07-27', 3007, 5001);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70008, 5760, '2012-09-10', 3002, 5001);


--3
CREATE ROLE junior_dev LOGIN;

--4
CREATE VIEW salesmen_in_newyork AS
SELECT *
FROM salesman
WHERE city = 'New York';

--5
CREATE VIEW order_details AS
SELECT o.ord_no, o.purch_amt, o.ord_date, s.name AS salesman_name, c.cust_name AS customer_name
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
JOIN customers c ON o.customer_id = c.customer_id;

GRANT ALL PRIVILEGES ON order_details TO junior_dev;

--6
CREATE VIEW top_grade_customers AS
SELECT *
FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON top_grade_customers TO junior_dev;

--7
CREATE VIEW salesman_count_per_city AS
SELECT city, COUNT(*) AS number_of_salesmen
FROM salesman
GROUP BY city;

GRANT ALL PRIVILEGES ON salesman_count_per_city TO junior_dev;

--8
CREATE VIEW salesmen_multiple_customers AS
SELECT s.salesman_id, s.name, COUNT(*) AS customer_count
FROM salesman s
JOIN customers c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name
HAVING COUNT(*) > 1;

GRANT ALL PRIVILEGES ON salesmen_multiple_customers TO junior_dev;

--9
CREATE ROLE intern;

GRANT junior_dev TO intern;



CREATE ROLE role1;
2

CREATE ROLE role2;
create user user1;
gran

grant update on orders to role2;
select * from pg_roles;
grant role2 to role1;





