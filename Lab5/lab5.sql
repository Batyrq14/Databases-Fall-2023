create database lab5;


-- Create the "customers" table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade numeric(3,0),
    salesman_id INTEGER
);

-- Insert data into the "customers" table
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', NULL, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

-- Create the "orders" table
CREATE TABLE orders (
    ord_no INTEGER PRIMARY KEY,
    purch_amt DECIMAL(8, 2),
    ord_date DATE,
    customer_id INTEGER,
    salesman_id INTEGER
);

-- Insert data into the "orders" table
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (5760, NULL, '2012-09-10', 3002, 5001);

-- Create the "salesman" table
CREATE TABLE salesman (
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5, 2)
);

-- Insert data into the "salesman" table
INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5003, 'Lauson Hen', NULL, 0.12),
    (5007, 'Paul Adam', 'Rome', 0.13);

--total purchase amount of all orders.
select sum(purch_amt) as total from orders;

--average purchase amount of all orders.
select avg(purch_amt) as average from orders;

--how many customer have listed their names.
select count(*) as total_customer_name
from customers
where cust_name is not null;

--min purchase
select min(purch_amt) as minimum from orders;

--customer name with the letter 'b'
select * from customers where cust_name like '%b';

--customers from 'New York'
select *
from orders
where customer_id in(select customer_id from customers where city = 'New York');

--customers who has order with purchase amount more than 10
select *
from customers
where customer_id in(select customer_id from orders where purch_amt > 10);

--total grade of all customers
select sum(grade) as total_grade from customers;

--customers who have listed their names
select *
from customers
where cust_name is not null;

--maximum grade of all the customers
select max(grade) as grade_max from customers;

create table Person(
    id integer,
    email varchar(250)
);

insert into Person
values (1,'a@b.com'),
       (2,'c@b.com'),
       (3,'a@b.com');

select * from Person;

select email as Email
from Person
group by email
having count(email) > 1;

select id
