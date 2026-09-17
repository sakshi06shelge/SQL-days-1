 CREATE database Assignment1_db;
SHOW databases;
USE Assignment1_db;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    age INT,
    email VARCHAR(150)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    duration_weeks INT,
    fee DECIMAL(8,2)
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);
-- Display the complete structure of tables
DESCRIBE students;

DESCRIBE courses;
-- Display all records from students
SELECT * FROM students;
-- Display only course_name and fee from courses
SELECT course_name, fee
FROM courses;
-- Insert 4 student records
INSERT INTO students (full_name, age, email)
VALUES
('Aarav Sharma', 21, 'aarav.sharma@gmail.com'),
('Sakshi Patil', 22, 'sakshi.patil@gmail.com'),
('Riya Kulkarni', 21, 'riya.kulkarni@gmail.com'),
('Aditya Joshi', 23, 'aditya.joshi@gmail.com');
-- Insert 3 courses
INSERT INTO courses (course_name, duration_weeks, fee)
VALUES
('Python', 8, 15000.00),
('Data Science', 12, 22000.00),
('Web Development', 10, 18000.00);
SELECT * FROM courses;
-- Add phone_number to the END of students
ALTER TABLE students
add column phone_number varchar(15);

-- Add gender after the age column
ALTER TABLE students
ADD COLUMN gender VARCHAR(10)
AFTER age;

-- Update student ID 2's age to 22
update students SET age = 22 WHERE student_ID = 2;

-- Change Data Science fee to ₹25,000
UPDATE courses
SET fee = 25000.00
WHERE course_id = 2;
-- Rename full_name to student_name
ALTER TABLE students
RENAME COLUMN full_name TO student_name;

-- Rename duration_weeks to course_duration
ALTER TABLE courses
RENAME COLUMN duration_weeks to course_duration;

-- Change phone_number from VARCHAR(15) to VARCHAR(20)
ALTER TABLE students
modify phone_number varchar(20);

-- Change age from INT to TINYINT
ALTER TABLE students
modify age TINYINT;