create database DeleteDuplicate;

create table  person(
    id integer,
    email varchar(250)
);

insert into person(id, email)
values(
        1,'john@example.com'),
        (2,'bob@example.com'),
        (3,'john@example.com');

select distinct email
from person
group by id,email;

DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM (
        SELECT id,
               ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
        FROM Person
    ) AS sub
    WHERE rn > 1
);


create table Activity(
    player_id int,
    device_id int,
    event_date date,
    games_played int
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);

select player_id,min(event_date) as first_login
from Activity
group by player_id;
