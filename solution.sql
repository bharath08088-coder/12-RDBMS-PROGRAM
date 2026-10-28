-- Create Department table
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Email VARCHAR(100),
    Department_ID INT,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

-- Create Faculty table
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50)
);

-- Create Course table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Faculty_ID INT,
    FOREIGN KEY (Faculty_ID)
        REFERENCES Faculty(Faculty_ID)
);

-- Create Enrollment table for M:N relationship
CREATE TABLE Enrollment (
    Student_ID INT,
    Course_ID INT,
    PRIMARY KEY (Student_ID, Course_ID),
    FOREIGN KEY (Student_ID)
        REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID)
        REFERENCES Course(Course_ID)
);

-- Insert Department records
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce');

-- Insert Student records
INSERT INTO Student VALUES
(101, 'Arun', 'arun@gmail.com', 1),
(102, 'Priya', 'priya@gmail.com', 1),
(103, 'Ravi', 'ravi@gmail.com', 2);

-- Insert Faculty records
INSERT INTO Faculty VALUES
(201, 'Dr. Kumar'),
(202, 'Dr. Meena');

-- Insert Course records
INSERT INTO Course VALUES
(301, 'DBMS', 201),
(302, 'SQL', 201),
(303, 'Accounting', 202);

-- Insert Enrollment records
INSERT INTO Enrollment VALUES
(101, 301),
(101, 302),
(102, 301),
(102, 303),
(103, 303);

-- Display student details with departments
SELECT S.Student_ID, S.Student_Name,
       D.Dept_Name
FROM Student S
JOIN Department D
ON S.Department_ID = D.Department_ID;

-- Display faculty and courses
SELECT F.Faculty_Name, C.Course_Name
FROM Faculty F
JOIN Course C
ON F.Faculty_ID = C.Faculty_ID;

-- Display student course enrollments
SELECT S.Student_Name, C.Course_Name
FROM Enrollment E
JOIN Student S
ON E.Student_ID = S.Student_ID
JOIN Course C
ON E.Course_ID = C.Course_ID;
