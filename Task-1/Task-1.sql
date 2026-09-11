-- ============================================
-- SQL TASKS - STUDENT DATABASE
-- ============================================

-- Task 1: Create database
CREATE DATABASE student_db;


-- Task 2: Display all databases
SHOW DATABASES;


-- Task 3: Select student_db
USE student_db;


-- Task 4 & 5: Create students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    department VARCHAR(100),
    admission_date DATE
);


-- Task 6: Display structure of students table
DESC students;


-- Task 7: Insert 5 student records
INSERT INTO students
(name, age, department, admission_date)
VALUES
('Akhil', 23, 'Computer Science', '2026-06-15'),
('Priya', 21, 'Information Technology', '2026-06-16'),
('Shiva', 19, 'Mechanical Engineering', '2026-06-17'),
('Meghana', 20, 'Electronics', '2026-06-18'),
('Hashim', 22, 'Commerce', '2026-06-19');


-- Task 8: Display all student records
SELECT * FROM students;


-- Task 9: Display only name and department
SELECT name, department
FROM students;


-- Task 10: Create courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration VARCHAR(50),
    course_fee DECIMAL(10,2)
);