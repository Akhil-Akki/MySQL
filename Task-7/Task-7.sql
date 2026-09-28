USE college_db;


-- 1. Find the total number of students
SELECT COUNT(*) AS total_students
FROM students;


-- 2. Find the total marks of all students
SELECT SUM(marks) AS total_marks
FROM students;


-- 3. Find the average marks of all students
SELECT AVG(marks) AS average_marks
FROM students;


-- 4. Find the highest and lowest marks
SELECT
    MAX(marks) AS highest_marks,
    MIN(marks) AS lowest_marks
FROM students;


-- 5. Find the number of students in each department
SELECT
    department_id,
    COUNT(*) AS student_count
FROM students
GROUP BY department_id;


-- 6. Find the average marks for each department
SELECT
    department_id,
    AVG(marks) AS average_marks
FROM students
GROUP BY department_id;


-- 7. Find the highest marks in each department
SELECT
    department_id,
    MAX(marks) AS highest_marks
FROM students
GROUP BY department_id;


-- 8. Display departments having more than 2 students
SELECT
    department_id,
    COUNT(*) AS student_count
FROM students
GROUP BY department_id
HAVING COUNT(*) > 2;


-- 9. Display departments whose average marks are greater than 80
SELECT
    department_id,
    AVG(marks) AS average_marks
FROM students
GROUP BY department_id
HAVING AVG(marks) > 80;


-- 10. Department-wise report
SELECT
    d.department_name,
    COUNT(s.student_id) AS student_count,
    SUM(s.marks) AS total_marks,
    AVG(s.marks) AS average_marks,
    MIN(s.marks) AS minimum_marks,
    MAX(s.marks) AS maximum_marks
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_marks DESC;