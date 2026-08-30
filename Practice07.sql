CREATE TABLE Employee (
    Eid VARCHAR(10) PRIMARY KEY,
    Salary DECIMAL(10, 2) NOT NULL,
    Gender CHAR(1)
);

INSERT INTO Employee (Eid, Salary, Gender) VALUES 
('E1', 50000.00, 'M'),
('E2', 60000.00, 'F'),
('E3', 55000.00, 'M'),
('E4', 70000.00, 'F'),
('E5', 65000.00, 'M'),
('E6', 72000.00, 'F'),
('E7', 58000.00, 'M'),
('E8', 75000.00, 'F'),
('E9', 62000.00, 'M'),
('E10', 80000.00, 'F');

SELECT Eid
FROM Employee
WHERE
    Gender = 'F'
    AND Salary > ALL (
        SELECT Salary
        FROM Employee
        WHERE
            Gender = 'M'
    );

SELECT Eid
FROM Employee
WHERE
    Gender = 'F'
    AND Salary > (
        SELECT MAX(Salary)
        FROM Employee
        WHERE
            Gender = 'M'
    );

SELECT Eid
FROM Employee
WHERE
    Gender = 'F' EXCEPT
SELECT DISTINCT
    E1.Eid
FROM Employee E1, Employee E2
WHERE
    E1.Gender = 'F'
    AND E2.Gender = 'M'
    AND E1.Salary < E2.Salary;

DROP TABLE Employee;