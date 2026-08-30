-- Find the employee(s) in each department who earn the highest salary within that department (i.e., the top earner per department).
CREATE TABLE Employee (
    Eid VARCHAR(10) PRIMARY KEY,
    Salary DECIMAL(10, 2) NOT NULL,
    Department VARCHAR(50) NOT NULL
);

INSERT INTO
    Employee (Eid, Salary, Department)
VALUES ('E1', 50000.00, 'HR'),
    ('E2', 60000.00, 'Finance'),
    ('E3', 55000.00, 'IT'),
    ('E4', 70000.00, 'Finance'),
    ('E5', 65000.00, 'IT'),
    ('E6', 72000.00, 'HR'),
    ('E7', 58000.00, 'Finance'),
    ('E8', 75000.00, 'IT'),
    ('E9', 62000.00, 'HR'),
    ('E10', 80000.00, 'Finance'),
    ('E11', 90000.00, 'IT'),
    ('E12', 85000.00, 'HR'),
    ('E13', 95000.00, 'Finance'),
    ('E14', 100000.00, 'IT'),
    ('E15', 110000.00, 'HR'),
    ('E16', 120000.00, 'Finance'),
    ('E17', 130000.00, 'IT'),
    ('E18', 140000.00, 'HR'),
    ('E19', 150000.00, 'Finance'),
    ('E20', 160000.00, 'IT');

SELECT Eid, Salary, Department
FROM Employee
WHERE (Department, Salary) IN (
        SELECT Department, MAX(Salary)
        FROM Employee
        GROUP BY
            Department
    );

SELECT E1.Eid, E1.Salary, E1.Department
FROM Employee E1
WHERE
    E1.Salary >= All (
        SELECT E2.Salary
        from Employee E2
        where
            E1.Department = E2.Department
    );

SELECT E1.Eid, E1.Salary, E1.Department
FROM Employee E1
WHERE
    NOT EXISTS (
        SELECT *
        FROM Employee E2
        WHERE
            E1.Department = E2.Department
            AND E2.Salary > E1.Salary
    );

SELECT E1.Eid, E1.Salary, E1.Department
FROM Employee E1
WHERE
    E1.Salary = (
        SELECT MAX(E2.Salary)
        FROM Employee E2
        WHERE
            E1.Department = E2.Department
    );

SELECT Eid, Salary, Department
FROM Employee ExCEPT
SELECT E1.Eid, E1.Salary, E1.Department
FROM Employee E1, Employee E2
WHERE
    E1.Department = E2.Department
    AND E1.Salary < E2.Salary;
DROP TABLE Employee;