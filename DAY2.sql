CREATE DATABASE company_training1;

USE company_training1;
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);
DESCRIBE staff;
INSERT INTO staff
(first_name, last_name, department, salary, joining_date)
VALUES
('Aarav', 'Sharma', 'IT', 45000.00, '2022-01-15'),
('Priya', 'Patel', 'HR', 40000.00, '2021-06-20'),
('Rahul', 'Verma', 'Finance', 55000.00, '2020-03-10'),
('Sneha', 'Joshi', 'Marketing', 48000.00, '2023-02-05'),
('Arjun', 'Mehta', 'IT', 60000.00, '2019-11-18'),
('Ananya', 'Rao', 'Finance', 52000.00, '2022-08-25');
SELECT * FROM staff;
-- Display only first name and department
SELECT first_name, department
FROM staff;

-- Display employee ID and first name with different column headings
SELECT 
staff_id AS Employee_ID,
first_name AS Employee_name
FROM staff;
SELECT
    department AS Employee_Department,
    salary AS Employee_Salary
FROM staff;
-- Display employee's complete name in a single column
SELECT
    CONCAT(first_name, ' ', last_name) AS Full_Name
FROM staff;
-- Display complete name along with salary
SELECT
    CONCAT(first_name, ' ', last_name) AS Full_Name,
    salary AS Salary
FROM staff;

-- First name along with a fixed employment status
SELECT
    first_name,
    'Permanent' AS Employment_Status
FROM staff;

-- Department along with a fixed company location
SELECT
    department,
    'Pune' AS Company_Location
FROM staff;

-- 13.	Display the employee's first name along with a financial year value for every row.
SELECT
    first_name,
    '2025-26' AS Financial_Year
FROM staff;

-- 14.	Display the employee's salary along with an additional calculated amount equal to 15% of the salary.
SELECT 
salary,
round(salary * 0.15,2) AS '15% bonus',
upper(department) AS 'department CAPITAL'
FROM staff;

-- 15.	Display each employee's salary along with an additional calculated amount equal to 20% of the salary
SELECT 
salary,
round(salary * 0.20, 2) AS '20% bonus'
FROM staff;

-- Display the department names completely in uppercase.
SELECT
upper(department) AS 'department UPERCASE'
FROM staff;

-- Display the first name and department where the department name appears entirely in uppercase.
SELECT
first_name,
upper(department) AS 'department UPERCASE'
FROM staff;

-- Display the employee's complete name together with the department.
SELECT 
concat(first_name, ' ' , last_name) AS 'Full_name',
department
FROM staff;

-- Display the complete name and joining date using user-friendly column headings
SELECT
    CONCAT(first_name, ' ', last_name) AS Employee_Name,
    joining_date AS Date_Joined
FROM staff;

SELECT
    salary,
    salary * 8 / 100 AS Incentive
FROM staff;

-- Display only the unique department names available in the table.
SELECT distinct department FROM staff;

-- Display only the unique joining dates present in the table.
SELECT distinct joining_date FROM staff;

-- Display the employee ID, full name, and department using meaningful output column names.
SELECT 
staff_id AS Emplyee_id,
concat(first_name, ' ' ,last_name) AS Full_name,
department AS Department_Name
FROM staff;

-- Display every employee along with a fixed message indicating they belong to the organization.
SELECT
first_name,
'Thay belong to the organization' AS Organization_status
FROM staff;

-- Display the first name, salary, and a calculated annual bonus equal to 12% of the salary.
SELECT
first_name,
salary,
salary * 12 / 100 AS annual_bonus
FROM staff;

-- Display the department in uppercase together with a fixed financial year for every employee.
SELECT
upper(department) AS Department,
'2025-26' AS financial_year
from staff;

-- Display the employee's full name followed by the joining date.
SELECT
concat(first_name, ' ' , last_name, '= ' ,joining_date) AS Employee_dtails
FROM staff;

-- Display the first name, last name, department, and salary using your own customized output column names.
SELECT
    first_name AS value_Name,
    last_name AS Surname,
    department AS Work_Department,
    salary AS Monthly_Salary
FROM staff;

-- Display the employee's salary and another column showing a calculated amount equal to 5% of the salary.
SELECT
salary,
salary * 5 / 100 AS aditional_Amount
FROM staff;