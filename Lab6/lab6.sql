--create database lab6;

create table locations
(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments
(
    department_id serial primary key ,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations
);

create table employees
(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

/*
 "I generated random data for this database
to practice my SQL skills and demonstrate
my understanding of database operations.
The data is entirely fictional and used
for educational purposes."
 */
-- Insert data into the 'locations' table
INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Main St', '12345', 'New York', 'NY'),
    ('456 Elm St', '67890', 'Los Angeles', 'CA'),
    ('789 Oak St', '54321', 'Chicago', 'IL'),
    ('101 Pine St', '98765', 'San Francisco', 'CA'),
    ('202 Maple St', '24680', 'Miami', 'FL'),
    ('303 Cherry St', '13579', 'Seattle', 'WA'),
    ('404 Walnut St', '86420', 'Boston', 'MA'),
    ('505 Cedar St', '97531', 'Houston', 'TX'),
    ('606 Birch St', '78901', 'Denver', 'CO'),
    ('707 Pineapple St', '12340', 'Miami', 'FL');

-- Insert data into the 'departments' table
INSERT INTO departments (department_id, department_name, budget, location_id)
VALUES
    (10,'HR', 100000, 1),
    (80,'Sales', 150000, 2),
    (70,'Marketing', 120000, 3),
    (50,'IT', 200000, 4),
    (100,'Finance', 130000, 5),
    (30,'Research', 90000, 6),
    (60,'Customer Service', 110000, 7),
    (90,'Engineering', 220000, 8),
    (40,'Product Development', 160000, 9),
    (20,'Quality Control', 95000, 10);

-- Insert data into the 'employees' table
INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('John', 'Smith', 'john.smith@example.com', '(123) 456-7890', 60000, 20),
    ('Mary', 'Johnson', 'mary.johnson@example.com', '(234) 567-8901', 0,null),
    ('David', 'Williams', 'david.williams@example.com', null , 80000, 80),
    ('Susan', 'Brown', 'susan.brown@example.com', '(456) 789-0123', 90000, 70),
    ('Michael', 'Davis', 'michael.davis@example.com', '(567) 890-1234', 100000, 90),
    ('Jennifer', null , 'jennifer.wilson@example.com', '(678) 901-2345', 75000, 50),
    ('Robert', 'Jones', 'robert.jones@example.com', '(789) 012-3456', 0,null),
    ('Linda', 'Martinez', null, '(890) 123-4567', 72000, 30),
    ('William', 'Clark', 'william.clark@example.com', '(901) 234-5678', 95000, 60),
    ('Karen', 'Harris', 'karen.harris@example.com', '(012) 345-6789', 78000, 10);


--3
select first_name, last_name, department_id
from employees;
--3.1
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

--4
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (80, 40);

--5
select e.first_name, e.last_name, d.department_name , l.city , l.state_province
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
;

--6
select d.department_id,department_name,d.budget,d.location_id
from departments d
left join employees e on d.department_id = e.department_id;


--7
select e.first_name,e.last_name,d.department_id,d.department_name
from employees e
left join departments d on e.department_id = d.department_id;


-- drop table employees cascade
-- drop table locations cascade
-- drop table departments cascade

select * from employees;
select * from departments;
select * from locations;

select d.department_id , d.department_name
from departments d
left join employees e on d.department_id = e.department_id
where e.salary = 0;

select d.department_name
from  departments d
left join employees e on d.department_id = e.department_id
where e.department_id is null;


select d.department_name
from  departments d
right join employees e on d.department_id = e.department_id
where e.department_id is null;

delete from employees
       where department_id is null;

select * from departments
where department_id not in(select d.department_id
                           from departments d
                               right join employees e on e.department_id= d.department_id);
