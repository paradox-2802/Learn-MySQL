CREATE TABLE Student (
    Sid VARCHAR(10) PRIMARY KEY,
    Sub1 INTEGER,
    Sub2 INTEGER
);

INSERT INTO Student (Sid, Sub1, Sub2) VALUES
('S1', 85, 90),
('S2', 78, 88),
('S3', 92, 95),
('S4', 80, 85),
('S5', 75, NULL);

SELECT Sid, (Sub1 + Sub2) / 2 AS Avg
FROM Student;
DROP TABLE Student;

CREATE TABLE Employee (
    Eid VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    PPNO VARCHAR(20) UNIQUE
);

INSERT INTO Employee (Eid, Name, PPNO) VALUES
('E1', 'Alice', 'PP12345'),
('E2', 'Bob', 'PP67890'),
('E3', 'Charlie', 'PP54321'),
('E4', 'David', 'PP98765'),
('E5', 'Eve', NULL),
('E6', 'Frank', 'PP11111');

SELECT Eid
FROM Employee
WHERE PPNO IS NULL;

DROP TABLE Employee;
