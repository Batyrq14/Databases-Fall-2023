
create database lab7;

create table dealer (
    id integer primary key ,
    name varchar(255),
    location varchar(255),
    commission float
);

INSERT INTO dealer (id, name, location, commission) VALUES (101, 'Oleg', 'Astana', 0.15);
INSERT INTO dealer (id, name, location, commission) VALUES (102, 'Amirzhan', 'Almaty', 0.13);
INSERT INTO dealer (id, name, location, commission) VALUES (105, 'Ademi', 'Taldykorgan', 0.11);
INSERT INTO dealer (id, name, location, commission) VALUES (106, 'Azamat', 'Kyzylorda', 0.14);
INSERT INTO dealer (id, name, location, commission) VALUES (107, 'Rahat', 'Satpayev', 0.13);
INSERT INTO dealer (id, name, location, commission) VALUES (103, 'Damir', 'Aktobe', 0.12);

create table client (
    id integer primary key ,
    name varchar(255),
    city varchar(255),
    priority integer,
    dealer_id integer references dealer(id)
);

INSERT INTO client (id, name, city, priority, dealer_id) VALUES (802, 'Bekzat', 'Satpayev', 100, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (807, 'Aruzhan', 'Almaty', 200, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (805, 'Али', 'Almaty', 200, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (808, 'Yerkhan', 'Taraz', 300, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (804, 'Aibek', 'Kyzylorda', 300, 106);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (809, 'Arsen', 'Taldykorgan', 100, 103);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (803, 'Alen', 'Shymkent', 200, 107);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (801, 'Zhandos', 'Astana', null, 105);

create table sell (
    id integer primary key,
    amount float,
    date timestamp,
    client_id integer references client(id),
    dealer_id integer references dealer(id)
);

INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (201, 150.5, '2021-10-05 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (209, 270.65, '2021-09-10 00:00:00.000000', 801, 105);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (202, 65.26, '2021-10-05 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (204, 110.5, '2021-08-17 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (207, 948.5, '2021-09-10 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (205, 2400.6, '2021-07-27 00:00:00.000000', 807, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (208, 5760, '2021-09-10 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (210, 1983.43, '2021-10-10 00:00:00.000000', 804, 106);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (203, 2480.4, '2021-10-10 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (212, 250.45, '2021-06-27 00:00:00.000000', 808, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (211, 75.29, '2021-08-17 00:00:00.000000', 803, 107);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (213, 3045.6, '2021-04-25 00:00:00.000000', 802, 101);

-- drop table client;
-- drop table dealer;
-- drop table sell;

--a
select c.name
from client c
where priority < 300;

--b
select *
from dealer d
cross join client c ;

--c
select d.name, c.name,c.city,c.priority,s.id,s.date,s.amount
from dealer d
join client c on d.id = c.dealer_id
join sell s on d.id = s.dealer_id and c.id = s.client_id;

--c.1
select d.name,c.name,c.city,c.priority,s.id,s.date,s.amount
from dealer d
join client c on d.id = c.dealer_id
join sell s on  c.id = s.client_id;

--d
select d.name, d.location,c.name, c.city
from dealer d
join client c on d.location = c.city;

--e
select s.id,s.amount,c.name,c.city
from sell s
join client c on s.client_id = c.id
where amount > 200 and amount < 500;

--e.1
select s.id,s.amount,c.name,c.city
from sell s
join client c on s.client_id = c.id
where s.amount between 200 and 500;

--f
select d.name , c.name
from dealer d
left join client c on d.id = c.dealer_id
where c.id is null or c.id is not null;

--g
select d.name, c.name, c.city,d.commission
from dealer d
join client c on d.id = c.dealer_id;


--h
select c.name,c.city,d.name,d.commission
from client c
join dealer d on c.dealer_id = d.id
where d.commission > 0.13;


--i
select c.name,c.city,s.id,s.date,s.amount,d.name,d.commission
from client c
left join sell s on c.id = s.client_id
left join dealer d on c.dealer_id = d.id;



--j
select c.name,c.priority,d.name, s.id,s.amount
from client c
left JOIN dealer d ON d.id = c.dealer_id
left JOIN sell s ON c.id = s.client_id
group by  c.name, c.priority, d.name, s.id, s.amount, s.client_id
having (count(s.client_id) >= 1 or s.amount > 2000 and c.priority is not null) or s.client_id is null;



