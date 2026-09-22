USE student_db;

-- 1. Display all student names in uppercase using UPPER()
SELECT UPPER(name) AS student_name_uppercase
FROM students;

-- 2. Display all student names in lowercase using LOWER()
SELECT LOWER(name) AS student_name_lowercase
FROM students;

-- 3. Display each student's name along with the length of their name using LENGTH()
SELECT name, LENGTH(name) AS name_length
FROM students;

-- 4. Display student marks rounded to 2 decimal places using ROUND()
SELECT name, ROUND(marks, 2) AS rounded_marks
FROM students;

-- 5. Display student marks rounded up to the nearest whole number using CEIL()
SELECT name, CEIL(marks) AS rounded_up_marks
FROM students;

-- 6. Display student marks rounded down to the nearest whole number using FLOOR()
SELECT name, FLOOR(marks) AS rounded_down_marks
FROM students;

-- 7. Display the current date and time using NOW() and the current date using CURDATE()
SELECT 
    NOW() AS current_date_time,
    CURDATE() AS today_date;
    
-- 8. Calculate the number of days since each student's admission date using DATEDIFF()
SELECT name, admission_date,
       DATEDIFF(CURDATE(), admission_date) AS days_since_admission
FROM students;

-- 9. Display each student's name and department together using CONCAT()
SELECT CONCAT(name, ' - ', department) AS student_details
FROM students;

-- 10. Use multiple MySQL functions in a single SELECT statement
SELECT
    UPPER(name) AS student_name,
    ROUND(marks, 1) AS rounded_marks,
    LENGTH(name) AS name_length,
    DATEDIFF(CURDATE(), admission_date) AS days_since_admission
FROM students;
