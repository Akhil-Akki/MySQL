CREATE DATABASE IF NOT EXISTS task5;

USE task5;

-- 1. Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);


-- 2. Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);


-- 3. Add email column to students table
ALTER TABLE students
ADD COLUMN email VARCHAR(150) NOT NULL UNIQUE;


-- 4. Add status column with default value 'Active'
ALTER TABLE students
ADD COLUMN status VARCHAR(20) DEFAULT 'Active';


-- 5. Add department_id column and create Foreign Key
ALTER TABLE students
ADD COLUMN department_id INT,
ADD CONSTRAINT fk_student_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);


-- 6. Insert at least 4 departments
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Artificial Intelligence'),
(4, 'Data Science');


-- 7. Insert at least 5 students without providing student_id
INSERT INTO students (name, email, department_id)
VALUES
('Akhil', 'akhil08@gmail.com', 1),
('Abhinaya', 'abhinaya13@gmail.com', 2),
('Ramya', 'ramya17@gmail.com', 3),
('Divya', 'divya26@gmail.com', 1),
('Navya', 'navya20@gmail.com', 4);


-- 8. Try inserting a student with a duplicate email
-- This will give a UNIQUE constraint error.
INSERT INTO students (name, email, department_id)
VALUES ('Kiran', 'akhil@gmail.com', 2);


-- 9. Try inserting a student with a non-existing department_id
-- This will give a FOREIGN KEY constraint error.
INSERT INTO students (name, email, department_id)
VALUES ('Kiran', 'kiran@gmail.com', 99);


-- 10. Add phone_number column and make it UNIQUE
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15) UNIQUE;