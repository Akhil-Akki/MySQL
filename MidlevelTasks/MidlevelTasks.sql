-- TASK 1 — DATABASE & TABLES

-- 1. Create database
CREATE DATABASE IF NOT EXISTS college_db;

-- Select database
USE college_db;


-- 2. Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);


-- 3. Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    age INT,
    marks DECIMAL(5,2),
    department_id INT,
    admission_date DATE,
    status VARCHAR(20) DEFAULT 'Active',

    -- 9. Foreign Key
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


-- TASK 2 — CONSTRAINTS

-- 6 & 7. NOT NULL and UNIQUE constraint on email
ALTER TABLE students
ADD CONSTRAINT uq_student_email UNIQUE (email);


-- TASK 3 — INSERT DATA

-- 10. Insert 5 departments
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'CSE'),
(2, 'ECE'),
(3, 'IT'),
(4, 'Cyber Security'),
(5, 'Artificial Intelligence');


-- 11 & 12 & 13. Insert 15 students
INSERT INTO students
(student_name, email, age, marks, department_id, admission_date)
VALUES
('Akhil', 'akhil@gmail.com', 22, 91.50, 1, '2025-06-10'),
('Mahathi', 'mahathi@gmail.com', 21, 85.75, 1, '2025-06-15'),
('Priya', 'priya@gmail.com', 20, 78.50, 2, '2025-07-01'),
('Raju', 'raju@gmail.com', 23, 88.25, 3, '2025-06-20'),
('Ananya', 'ananya@gmail.com', 21, 95.00, 1, '2025-06-12'),
('Ramya', 'ramya@gmail.com', 22, 67.50, 4, '2025-07-05'),
('Manisha', 'manisha@gmail.com', 20, 82.00, 2, '2025-06-25'),
('Vinuthna', 'vinuthna@gmail.com', 24, 59.75, 5, '2025-07-10'),
('Divya', 'divya@gmail.com', 21, 73.25, 3, '2025-06-18'),
('Akhila', 'akhila@gmail.com', 22, 89.50, 1, '2025-06-14'),
('Meena', 'meena@gmail.com', 20, 64.00, 2, '2025-07-03'),
('Indhuja', 'indhuja@gmail.com', 23, 76.75, 3, '2025-06-22'),
('Swathi', 'swathi@gmail.com', 21, 92.25, 1, '2025-06-11'),
('Raghu', 'raghu@gmail.com', 22, 55.50, 4, '2025-07-08'),
('Shiva', 'shiva@gmail.com', 20, 81.25, 5, '2025-06-28');


-- Check inserted departments
SELECT * FROM departments;

-- Check inserted students
SELECT * FROM students;


-- TASK 4 — SELECT & FILTERING

-- 14. Display all students
SELECT * 
FROM students;


-- 15. Display only student names, departments, and marks
SELECT student_name, department_id, marks
FROM students;


-- 16. Students who scored more than 80
SELECT *
FROM students
WHERE marks > 80;


-- 17. Students whose marks are between 60 and 90
SELECT *
FROM students
WHERE marks BETWEEN 60 AND 90;


-- 18. Students belonging to CSE, ECE, or IT
SELECT *
FROM students
WHERE department_id IN (1, 2, 3);


-- 19. Students whose names start with A
SELECT *
FROM students
WHERE student_name LIKE 'A%';


-- 20. Students whose names contain the letter 'a'
SELECT *
FROM students
WHERE student_name LIKE '%a%';


-- 21. Students who are not from CSE
SELECT *
FROM students
WHERE department_id <> 1;


-- 22. Students older than 20 and scored more than 75
SELECT *
FROM students
WHERE age > 20
AND marks > 75;


-- TASK 5 — SORTING & LIMITING

-- 23. Order by marks highest to lowest
SELECT *
FROM students
ORDER BY marks DESC;


-- 24. Order by name alphabetically
SELECT *
FROM students
ORDER BY student_name ASC;


-- 25. Top 5 students based on marks
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 5;


-- 26. 3 students with the lowest marks
SELECT *
FROM students
ORDER BY marks ASC
LIMIT 3;


-- TASK 6 — UPDATE & DELETE

-- 31. Verify student before updating
SELECT *
FROM students
WHERE student_id = 1;


-- 27. Update marks of a specific student
UPDATE students
SET marks = 94.00
WHERE student_id = 1;


-- Verify updated record
SELECT *
FROM students
WHERE student_id = 1;


-- 31. Verify student before changing department
SELECT *
FROM students
WHERE student_id = 2;


-- 28. Change department of a specific student
UPDATE students
SET department_id = 3
WHERE student_id = 2;


-- Verify updated department
SELECT *
FROM students
WHERE student_id = 2;


-- 31. Verify student before changing status
SELECT *
FROM students
WHERE student_id = 3;


-- 29. Change status from Active to Inactive
UPDATE students
SET status = 'Inactive'
WHERE student_id = 3;


-- Verify updated status
SELECT *
FROM students
WHERE student_id = 3;


-- 31. Verify student before deleting
SELECT *
FROM students
WHERE student_id = 15;


-- 30. Delete one specific student
DELETE FROM students
WHERE student_id = 15;


-- Verify deletion
SELECT *
FROM students
WHERE student_id = 15;


-- TASK 7 — FUNCTIONS

-- 32. Student names in uppercase
SELECT
    student_name,
    UPPER(student_name) AS uppercase_name
FROM students;


-- 33. Student names in lowercase
SELECT
    student_name,
    LOWER(student_name) AS lowercase_name
FROM students;


-- 34. Length of each student's name
SELECT
    student_name,
    LENGTH(student_name) AS name_length
FROM students;


-- 35. Marks rounded to 2 decimal places
SELECT
    student_name,
    ROUND(marks, 2) AS rounded_marks
FROM students;


-- 36. Number of days since admission
SELECT
    student_name,
    admission_date,
    DATEDIFF(CURDATE(), admission_date) AS days_since_admission
FROM students;


-- 37. Current date and time
SELECT NOW() AS current_date_time;


-- 38. Combined result
SELECT
    student_name,
    ROUND(marks, 2) AS rounded_marks,
    LENGTH(student_name) AS name_length,
    DATEDIFF(CURDATE(), admission_date) AS days_since_admission
FROM students;


-- TASK 8 — ALTER TABLE

-- 39. Add phone_number column
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15);


-- 40. Make phone_number UNIQUE
ALTER TABLE students
ADD CONSTRAINT uq_phone_number UNIQUE (phone_number);


-- 41. Add another appropriate column
ALTER TABLE students
ADD COLUMN gender VARCHAR(10);


-- Check table structure
DESCRIBE students;


-- FINAL CHALLENGE

-- 42. Top 3 CSE students
-- Showing:
-- Student name
-- Department
-- Marks
-- Name length
-- Days since admission

SELECT
    s.student_name,
    d.department_name AS department,
    ROUND(s.marks, 2) AS marks,
    LENGTH(s.student_name) AS name_length,
    DATEDIFF(CURDATE(), s.admission_date) AS days_since_admission
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
WHERE d.department_name = 'CSE'
ORDER BY s.marks DESC
LIMIT 3;


-- 43. Marks between 70 and 90,
-- department CSE or IT,
-- name contains 'a'

SELECT
    s.student_name,
    d.department_name AS department,
    s.marks
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
WHERE s.marks BETWEEN 70 AND 90
AND d.department_name IN ('CSE', 'IT')
AND s.student_name LIKE '%a%';


-- 44. Display students with department names
SELECT
    s.student_id,
    s.student_name,
    s.email,
    s.age,
    s.marks,
    d.department_name AS department,
    s.admission_date,
    s.status
FROM students s
JOIN departments d
    ON s.department_id = d.department_id;


-- TASK 45 — TEST CONSTRAINTS : Duplicate email. This should produce a UNIQUE constraint error.

INSERT INTO students
(student_name, email, age, marks, department_id, admission_date)
VALUES
('Test Student', 'akhil@gmail.com', 21, 75.00, 1, '2026-01-01');


-- TEST 2: Student without a name
-- This should produce a NOT NULL constraint error.

INSERT INTO students
(email, age, marks, department_id, admission_date)
VALUES
('noname@gmail.com', 21, 70.00, 1, '2026-01-01');


-- TEST 3: Invalid department ID
-- This should produce a FOREIGN KEY constraint error.

INSERT INTO students
(student_name, email, age, marks, department_id, admission_date)
VALUES
('Invalid Department', 'invaliddept@gmail.com', 22, 80.00, 99, '2026-01-01');