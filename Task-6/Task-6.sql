USE task5;
DESCRIBE students;
ALTER TABLE students
ADD COLUMN marks INT;
SELECT student_id, name, department_id, marks
FROM students;
ORDER BY student_id;

UPDATE students
SET marks = 99
WHERE student_id = 1;

UPDATE students
SET marks = 94
WHERE student_id = 2;

UPDATE students
SET marks = 91
WHERE student_id = 3;

UPDATE students
SET marks = 86
WHERE student_id = 4;

UPDATE students
SET marks = 88
WHERE student_id = 5;

UPDATE students
SET marks = 79
WHERE student_id = 6;

-- 1. INNER JOIN — Display each student's name and department name

SELECT s.name AS student_name, d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;


-- 2. INNER JOIN — Display students who belong to the CSE department

SELECT s.name AS student_name, d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'CSE';


-- 3. LEFT JOIN — Display all students, including students without a matching department

SELECT s.name AS student_name, d.department_name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id;


-- 4. RIGHT JOIN — Display all departments, including departments without students

SELECT d.department_name, s.name AS student_name
FROM students s
RIGHT JOIN departments d
ON s.department_id = d.department_id;


-- 5. LEFT JOIN — Find departments that currently have no students

SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN students s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;


-- 6. INNER JOIN + WHERE — Students who scored more than 80

SELECT s.name AS student_name, s.marks, d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
WHERE s.marks > 80;


-- 7. JOIN + ORDER BY — All students sorted by marks highest to lowes

SELECT s.name AS student_name, s.marks, d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
ORDER BY s.marks DESC;


-- 8. JOIN + LIMIT — Top 3 students based on marks

SELECT s.name AS student_name, s.marks, d.department_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id
ORDER BY s.marks DESC
LIMIT 3;


-- 9. FULL OUTER JOIN concept in MySQL using LEFT JOIN + RIGHT JOIN + UNION

SELECT s.name AS student_name, d.department_name
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id

UNION

SELECT s.name AS student_name, d.department_name
FROM students s
RIGHT JOIN departments d
ON s.department_id = d.department_id;


-- 10. Table aliases — Display student ID, student name, department name, and marks

SELECT
    s.student_id,
    s.name AS student_name,
    d.department_name,
    s.marks
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;