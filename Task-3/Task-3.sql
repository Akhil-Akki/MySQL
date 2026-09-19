USE student_db;
DESC students;
ALTER TABLE students
ADD COLUMN marks INT;
SELECT * FROM students;

-- 1. Display students who scored more than 80 marks
SELECT *
FROM students
WHERE marks > 80;


-- 2. Display students whose marks are between 60 and 80
SELECT *
FROM students
WHERE marks BETWEEN 60 AND 80;


-- 3. Display students who belong to CSE, ECE, or IT departments
SELECT *
FROM students
WHERE department IN ('CSE', 'ECE', 'IT');


-- 4. Display students whose names start with the letter A
SELECT *
FROM students
WHERE name LIKE 'A%';


-- 5. Display students whose names contain the letter a
SELECT *
FROM students
WHERE name LIKE '%a%';


-- 6. Display students who are not from the CSE department
SELECT *
FROM students
WHERE department != 'CSE';


-- 7. Display students who are from CSE and scored more than 75 marks
SELECT *
FROM students
WHERE department = 'CSE'
AND marks > 75;


-- 8. Display students who are from CSE or ECE
SELECT *
FROM students
WHERE department = 'CSE'
OR department = 'ECE';


-- 9. Display all students sorted by marks from highest to lowest
SELECT *
FROM students
ORDER BY marks DESC;


-- 10. Display the top 3 students with the highest marks
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 3;