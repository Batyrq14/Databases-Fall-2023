--lab4

--1
CREATE DATABASE lab4;

--2
CREATE TABLE Warehouses (
    code INTEGER PRIMARY KEY,
    location CHARACTER VARYING(255),
    capacity INTEGER
);

--DROP TABLE  Warehouses CASCADE ;

CREATE TABLE Boxes
(
    code      CHARACTER(4) PRIMARY KEY,
    contents  CHARACTER VARYING(255),
    value     REAL,
	warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);

--DROP TABLE Boxes;

--3
INSERT INTO Warehouses (code,location,capacity) VALUES
    (1, 'Chicago', 3),
    (2, 'Chicago', 4),
    (3, 'New York', 7),
    (4, 'Los Angeles', 2),
    (5, 'San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 180, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

--4
SELECT * FROM Warehouses;

--5
SELECT * FROM Boxes WHERE value > 150;

--6
SELECT DISTINCT contents FROM Boxes;

--7
SELECT warehouse, COUNT(*) AS box_count FROM Boxes GROUP BY warehouse;

--7.1
SELECT Warehouses.code,
COUNT(*) AS box_count
FROM Warehouses
LEFT JOIN Boxes on Warehouses.code = Boxes.warehouse
GROUP BY Warehouses.code;
--7.2
SELECT warehouse,
COUNT(*) AS box_count
FROM Boxes
LEFT JOIN Warehouses on Boxes.warehouse = Warehouses.code
GROUP BY warehouse;


--8
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

--8.1
SELECT  location, contents
FROM Warehouses
LEFT JOIN Boxes on Warehouses.capacity = Boxes.warehouse;

SELECT  location, contents
FROM Warehouses
LEFT JOIN Boxes on Warehouses.capacity = Boxes.warehouse;
/*
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) >= 2;
*/

-- 9
INSERT INTO Warehouses (code, location, capacity)
VALUES (6, 'New York', 3);

-- 10
INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

--11
UPDATE Boxes
SET value = value * 0.85
WHERE code = (
    SELECT code
    FROM Boxes
    ORDER BY value DESC
    OFFSET 2
    LIMIT 1
);


--12
DELETE FROM Boxes
WHERE value < 150;

/*
--13
DELETE FROM Boxes
WHERE warehouse = (SELECT code FROM Warehouses WHERE location = 'New York')
RETURNING *;
*/

--13
DELETE FROM Boxes
WHERE warehouse IN(SELECT code FROM Warehouses WHERE location = 'New York')
RETURNING *;



