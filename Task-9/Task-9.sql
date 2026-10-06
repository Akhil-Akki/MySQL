-- Select the database
USE college_db;


-- 1. Create accounts table and insert 5 accounts

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(10,2) NOT NULL
);

INSERT INTO accounts (account_id, account_holder, balance)
VALUES
(101, 'Akhil', 800000.00),
(102, 'Mahathi', 450000.00),
(103, 'Priya', 250000.00),
(104, 'Sneha', 180000.00),
(105, 'Divya', 300000.00);

SELECT * FROM accounts;


-- 2. Transfer ₹5,000 from one account to another

START TRANSACTION;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 102;


-- 3. Verify balances and COMMIT

SELECT account_id, account_holder, balance
FROM accounts
WHERE account_id IN (101, 102);

COMMIT;

-- Verify after COMMIT
SELECT * FROM accounts
WHERE account_id IN (101, 102);


-- 4. Deduct ₹2,000 and use ROLLBACK

START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 103;

-- Check the temporary change
SELECT * FROM accounts
WHERE account_id = 103;

-- Undo the change
ROLLBACK;

-- Verify that the deduction was undone
SELECT * FROM accounts
WHERE account_id = 103;


-- 5. Two student updates in one transaction

START TRANSACTION;

UPDATE students
SET marks = marks + 5
WHERE student_id = 1;

UPDATE students
SET marks = marks + 10
WHERE student_id = 23;

-- Check both changes
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23);

-- Undo both changes
ROLLBACK;

-- Verify both changes were undone
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23);


-- 6. SAVEPOINT and ROLLBACK TO SAVEPOINT

START TRANSACTION;

-- First update
UPDATE students
SET marks = marks + 5
WHERE student_id = 1;

-- Create savepoint
SAVEPOINT first_update;

-- Second update
UPDATE students
SET marks = marks + 10
WHERE student_id = 23;

-- Check both updates
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23);

-- Undo only the second update
ROLLBACK TO SAVEPOINT first_update;

-- Check the result
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23);

-- Keep the first update
COMMIT;


-- 7. Multiple SAVEPOINTS

START TRANSACTION;

-- First update
UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 101;

SAVEPOINT sp1;

-- Second update
UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 102;

SAVEPOINT sp2;

-- Third update
UPDATE accounts
SET balance = balance + 3000
WHERE account_id = 103;

SAVEPOINT sp3;

-- View all three changes
SELECT * FROM accounts
WHERE account_id IN (101, 102, 103);

-- Roll back third update
ROLLBACK TO SAVEPOINT sp2;

SELECT * FROM accounts
WHERE account_id IN (101, 102, 103);

-- Roll back second update also
ROLLBACK TO SAVEPOINT sp1;

SELECT * FROM accounts
WHERE account_id IN (101, 102, 103);

-- Keep only the first update
COMMIT;


-- 8. Banking transfer with an invalid second operation

START TRANSACTION;

-- First operation
UPDATE accounts
SET balance = balance - 3000
WHERE account_id = 104;

-- Intentionally invalid operation:
-- account_id 999 does not exist
UPDATE accounts
SET balance = balance + 3000
WHERE account_id = 999;

-- Check the first operation
SELECT * FROM accounts
WHERE account_id = 104;

-- Since the second operation is invalid,
-- rollback the entire transaction
ROLLBACK;

-- Verify that the first operation was also undone
SELECT * FROM accounts
WHERE account_id = 104;


-- 9. Update multiple related records

START TRANSACTION;

-- Update student 1
UPDATE students
SET marks = marks + 5
WHERE student_id = 1;

-- Update student 23
UPDATE students
SET marks = marks + 5
WHERE student_id = 23;

-- Update student 4
UPDATE students
SET marks = marks + 5
WHERE student_id = 4;

-- Verify all changes
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23, 4);

-- If the results are correct, commit
COMMIT;

-- Verify after COMMIT
SELECT student_id, student_name, marks
FROM students
WHERE student_id IN (1, 23, 4);


-- 10. Complete Banking Transaction Scenario

-- Check starting balances
SELECT * FROM accounts;

-- Start transaction
START TRANSACTION;

-- Transfer ₹4,000 from account 101 to account 102
UPDATE accounts
SET balance = balance - 4000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 4000
WHERE account_id = 102;

-- Create a savepoint
SAVEPOINT transfer_completed;

-- Additional transaction
UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 102;

-- Check balances
SELECT account_id, account_holder, balance
FROM accounts
WHERE account_id IN (101, 102);

-- Undo only the ₹1,000 deduction
ROLLBACK TO SAVEPOINT transfer_completed;

-- Verify balances
SELECT account_id, account_holder, balance
FROM accounts
WHERE account_id IN (101, 102);

-- Commit the ₹4,000 transfer
COMMIT;

-- Final verification
SELECT account_id, account_holder, balance
FROM accounts
WHERE account_id IN (101, 102);


-- FINAL ROLLBACK EXAMPLE

START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 105;

-- Check temporary change
SELECT * FROM accounts
WHERE account_id = 105;

-- Undo the transaction
ROLLBACK;

-- Verify original balance
SELECT * FROM accounts
WHERE account_id = 105;