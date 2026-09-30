USE college_db;



-- 1. Students who scored more than the average marks
SELECT *
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);


-- 2. Student(s) who scored the highest marks
SELECT *
FROM students
WHERE marks = (
    SELECT MAX(marks)
    FROM students
);


-- 3. Students whose marks are equal to the lowest marks
SELECT *
FROM students
WHERE marks = (
    SELECT MIN(marks)
    FROM students
);


-- 4. Students belonging to departments that have at least one student scoring above 90
SELECT *
FROM students
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM students
    WHERE marks > 90
);


-- 5. Students whose marks are greater than ANY marks scored by CSE students
SELECT *
FROM students
WHERE marks > ANY (
    SELECT s.marks
    FROM students s
    JOIN departments d
        ON s.department_id = d.department_id
    WHERE d.department_name = 'CSE'
);


-- 6. Students whose marks are greater than ALL marks scored by CSE students
SELECT *
FROM students
WHERE marks > ALL (
    SELECT s.marks
    FROM students s
    JOIN departments d
        ON s.department_id = d.department_id
    WHERE d.department_name = 'CSE'
);


-- 7. Departments that have at least one student using EXISTS
SELECT d.*
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM students s
    WHERE s.department_id = d.department_id
);


-- 8. Departments that currently have no students using NOT EXISTS
SELECT d.*
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM students s
    WHERE s.department_id = d.department_id
);


-- 9. Students who scored above their own department's average
SELECT s.*
FROM students s
WHERE s.marks > (
    SELECT AVG(s2.marks)
    FROM students s2
    WHERE s2.department_id = s.department_id
);


-- 10. Top 3 students with department name using a subquery + JOIN
SELECT 
    s.student_id,
    s.student_name,
    s.marks,
    d.department_name
FROM (
    SELECT *
    FROM students
    ORDER BY marks DESC
    LIMIT 3
) AS s
JOIN departments d
    ON s.department_id = d.department_id
ORDER BY s.marks DESC;