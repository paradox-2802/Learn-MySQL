CREATE TABLE Student (
    Sid VARCHAR(10) PRIMARY KEY,
    Sname VARCHAR(30),
    DOB DATE
);

CREATE TABLE Course (
    Cid VARCHAR(10) PRIMARY KEY,
    Cname VARCHAR(30),
    Instructor VARCHAR(30)
);

CREATE TABLE Enroll (
    Sid VARCHAR(10),
    Cid VARCHAR(10),
    Fee INT,
    PRIMARY KEY (Sid, Cid),
    FOREIGN KEY (Sid) REFERENCES Student(Sid) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Cid) REFERENCES Course(Cid) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Student (Sid, Sname, DOB) VALUES
('S001', 'Amit Roy',      '2003-05-14'),
('S002', 'Priya Sharma',  '2002-11-02'),
('S003', 'Rahul Das',     '2003-01-23'),
('S004', 'Sneha Ghosh',   '2004-07-19'),
('S005', 'Arjun Mehta',   '2002-09-30');

INSERT INTO Course (Cid, Cname, Instructor) VALUES
('C101', 'Database Systems',      'Dr. Sen'),
('C102', 'Data Structures',       'Dr. Banerjee'),
('C103', 'Computer Networks',     'Dr. Kumar'),
('C104', 'Operating Systems',     'Dr. Mitra');

INSERT INTO Enroll (Sid, Cid, Fee) VALUES
('S001', 'C101', 5000),
('S001', 'C102', 4500),
('S002', 'C101', 5000),
('S002', 'C103', 4800),
('S003', 'C102', 4500),
('S003', 'C104', 4700),
('S004', 'C101', 5000),
('S004', 'C104', 4700),
('S005', 'C103', 4800);

Select * from Student;
Select * from Course;
Select * from Enroll;
DROP TABLE Enroll;
drop table Student;
drop table Course;