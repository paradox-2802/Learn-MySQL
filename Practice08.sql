CREATE TABLE Employee(
    Eid VARCHAR(10) PRIMARY KEY,
    Salary INTEGER NOT NULL
);

INSERT INTO Employee (Eid, Salary) VALUES 
('E1', 50000),
('E2', 60000),
('E3', 55000),
('E4', 70000),
('E5', 65000),
('E6', 72000),
('E7', 58000),
('E8', 75000),
('E9', 62000),
('E10', 80000);

SELECT Eid
FROM Employee
WHERE
    Salary >= ALL (
        SELECT Salary
        FROM Employee
    );

SELECT Eid
FROM Employee
WHERE
    Salary = (
        SELECT MAX(Salary)
        FROM Employee
    );
 
SELECT Eid
FROM Employee EXCEPT
SELECT DISTINCT
    E1.Eid
FROM Employee E1, Employee E2
WHERE
    E1.Salary < E2.Salary;

SELECT DISTINCT
    E1.Eid
FROM Employee E1
WHERE NOT EXISTS (
    SELECT *
    FROM Employee E2
    WHERE
        E1.Salary < E2.Salary
    );

DROP TABLE Employee;