CREATE SCHEMA IF NOT EXISTS Assignment_3;
USE Assignment_3;

 CREATE TABLE employees(
id INT PRIMARY KEY auto_increment,
name varchar(100),
age INT,
salary int,
department varchar(100),
hire_date DATE
);

-- 4. Create a table named students 
CREATE TABLE students(
roll_no INT PRIMARY KEY auto_increment,
name varchar(100),
marks INT,
city varchar (100),
date_of_birth DATE
);
-- 5. Insert five records into the employees table
INSERT INTO employees(name,age,salary ,department ,hire_date )
VALUES
('sakshi',21,70000,'hr','2025-6-1'),
('sahil',35,75000,'finance','2024-6-4'),
('geeta',18,30000,'hr','2023-3-4'),
('mayuri',23,55000,'marketing','2025-12-9'),
('ralesh',19,65000,'manager','2024-3-11');
select * from employees;
-- 6. Insert three records into the students table
INSERT INTO students(name,marks,city,date_of_birth)
VALUES
('sakshi', 90, 'pune','2004-06-4'),
('rutuja', 80, 'mumbai','2004-08-5'),
('vaibhav',79, 'pune','2003-08-6'),
('vaibhav',82, 'mumbai','2003-08-6');
 select * from students;
 -- 7. Retrieve all employees who work in the 'HR' department.
SELECT * FROM  employees where department = 'hr';
  
-- 8. Retrieve all students whose marks are greater than 75.
SELECT * FROM  students where marks > 75;

-- 9. Retrieve all employees whose salary is less than 50000.
SELECT * FROM  employees where salary < 50000;

-- 10. Retrieve all employees who work in 'Finance' and have age greater than 30.
SELECT * FROM employees 
where department ='finance' AND age > 30;

-- 11. Retrieve all students who are from 'Mumbai' or have marks greater than 80.
SELECT * FROM students
where city ='mumbai' AND marks > 80;

-- 12. Retrieve all employees whose salary is between 30000 and 70000.
SELECT * FROM employees;
SELECT * FROM employees Where salary BETWEEN 30000 AND 70000;

-- 13. Retrieve all students whose marks are between 60 and 90.
INSERT INTO students(name,marks,city,date_of_birth)
VALUES
('sakshi', 60, 'pune','2004-06-4');
SELECT * FROM students Where marks BETWEEN 60 AND 90;

-- 14. Retrieve all employees whose department is either 'IT', 'HR', or 'Sales'.
SELECT * FROM employees
WHERE department IN('IT','HR','sales');

-- 15. Retrieve all students whose city is one of 'Delhi', 'Pune', or 'Chennai'.
SELECT * FROM students
WHERE city IN('pune','delhi','chaini');

-- 16. Retrieve all employees whose name starts with the letter 'A'.
SELECT * FROM employees where name LIKE 'S%';

-- 17. Retrieve all students whose name contains the word 'kumar'.
INSERT INTO employees(name,age,salary ,department ,hire_date )
VALUES
('kumar',40,44000,'it','2025-5-1'),
('sahilkumar gupta',50,34000,'finance','2024-9-4');
SELECT * FROM employees;
SELECT * FROM employees where name LIKE '%kumar%';

-- 18. Employees whose department ends with ing
SELECT * FROM employees WHERE department LIKE '%ing';

-- 19. Employees hired before today's date
SELECT * FROM employees WHERE hire_date < curdate();

-- 22. Student names in uppercase + marks
SELECT 
upper(name) AS student_name,
marks
FROM students;

-- 24. Calculate monthly salary from annual salary
SELECT
    name,
    salary AS Annual_Salary,
    salary / 12 AS Monthly_Salary
FROM employees;

-- 25. Employees whose annual salary / 12 is greater than 5000
SELECT * FROM employees WHERE salary / 12 >5000;

-- 26. Age multiplied by 100 as a score
SELECT
    name,
    age,
    age * 100 AS Age_Score
FROM employees;

-- 27. Student marks ≥ 50 → TRUE/FALSE
SELECT 
name,
marks,
marks >= 50 AS passed
FROM students;

-- 30. Name, department + whether salary × 1.1 exceeds 55000
SELECT
    name,
    department,
    salary * 1.1 > 55000 AS Salary_Check
FROM employees;