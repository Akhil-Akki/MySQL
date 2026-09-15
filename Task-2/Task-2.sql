USE student_db;

INSERT INTO students (student_id, name, age, department, admission_date)
VALUES (6, 'Srija', 22, 'CSE', '2026-09-15');


-- Task 2: Insert five student records at once
INSERT INTO students (student_id, name, age, department, admission_date)
VALUES
(7, 'Harshitha', 20, 'ECE', '2026-09-15'),
(8, 'Manisha', 22, 'CSE', '2026-09-15'),
(9, 'Indhuja', 19, 'IT', '2026-09-15'),
(10, 'Ananya', 23, 'CSE', '2026-09-15'),
(11, 'Divya', 21, 'CSE', '2026-09-15');

-- Task-3: Display all records
SELECT *
FROM students;

-- Task-4: Display only name, age, and department
SELECT name, age, department
FROM students;


-- Task-5: Update age using student_id
UPDATE students
SET age = 23
WHERE student_id = 6;


-- Task-6: Update department and age in one UPDATE
UPDATE students
SET age = 21,
    department = 'CSE'
WHERE student_id = 7;


-- Task-7: Display CSE students
SELECT *
FROM students
WHERE department = 'CSE';


-- Task-8: Display students older than 20
SELECT *
FROM students
WHERE age > 20;

-- Task-9: Delete one specific student
DELETE FROM students
WHERE student_id = 5;


-- Task-10: Verify before UPDATE or DELETE
SELECT *
FROM students
WHERE student_id = 8;

UPDATE students
SET age = 24
WHERE student_id = 8;

SELECT *
FROM students
WHERE student_id = 4;

DELETE FROM students
WHERE student_id = 4;

SELECT *
FROM students
ORDER BY student_id;