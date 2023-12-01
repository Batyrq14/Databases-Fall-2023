create database lab07;

-- drop table countries;

create table countries(
    name varchar(200)
);

insert into countries(name)
values ('string');
DO
$$
    DECLARE
        i INTEGER := 0;
    BEGIN
        WHILE i < 1000000
            LOOP
                INSERT INTO countries (name)
                values ('string' || md5(random()::text));
                i := i + 1;
            END LOOP;
    END
$$;

select count(*) from countries;

insert into countries(name)
values ('string'),
       ('string');
drop table departments;
create table departments(
    department_id   serial primary key,
    department_name varchar(50) unique,
    budget int
);

drop table employees;
create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary int,
    department_id int references departments(department_id) on delete cascade
);

insert into departments(department_name, budget)
values ('dep1', 10000000);

DO
$$
    DECLARE
        i INTEGER := 0;
    BEGIN
        WHILE i < 1000000
            LOOP
                INSERT INTO employees(first_name, last_name, salary, department_id)
                values ('string' || md5(random()::text), 'string' || md5(random()::text), floor(random() * 100000 + 1)::INT, 1);
                i := i + 1;
            END LOOP;
    END
$$ language plpgsql;

drop table orders;
CREATE TABLE orders
(
    order_id     serial PRIMARY KEY,
    user_id int,
    product_name VARCHAR(255) NOT NULL,
    order_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO
$$
    DECLARE
        j INTEGER := 0;
    BEGIN
        WHILE j < 2000000
            LOOP
                INSERT INTO orders (user_id, product_name)
                VALUES (floor(random() * 1000000 + 1)::INT, 'Product-' || md5(random()::text));
                j := j + 1;
            END LOOP;
    END
$$;

--1
create index countries_name_idx on countries(name);
drop index countries_name_idx;

explain analyse
select * from countries
where name = 'string';

--2
create index employees_name_surname_idx on employees(first_name, last_name);

explain analyse
select * from employees
where first_name = 'string' and last_name = 'string';

--3

create unique index employees_salary_idx on employees(salary, employee_id);
drop index employees_salary_idx;

explain analyse
select * from employees
where salary > 30000 and salary < 50000;

--4
create index employees_substr_first_name_idx on employees(substring(first_name from 1 for 7));
drop index  employees_substr_first_name_idx;

explain analyse
select * from employees
where substring(first_name from 1 for 7) = 'string8';


--5

create index employees_fifth_one_idx on employees(department_id, salary);
drop index employees_fifth_one_idx;

create index departments_fifth_sec_idx on departments(department_id, budjet);
drop index departments_fifth_sec_idx;


select budjet from departments;

explain analyse
select * from employees e
    join departments d on d.department_id = e.department_id
where d.budjet > 100000 and e.salary > 30000;
