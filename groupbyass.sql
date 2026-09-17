-- group by 

CREATE DATABASE company_groupby_demo;
USE company_groupby_demo;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    job_role VARCHAR(50),
    hire_date DATE,
    city VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    experience_years INT,
    bonus DECIMAL(10,2),
    projects_completed INT,
    monthly_incentive DECIMAL(10,2),
    branch VARCHAR(50),
    education_level VARCHAR(50),
    designation VARCHAR(50)
);

INSERT INTO employees
(employee_name, department, salary, job_role, hire_date, city, gender,
age, experience_years, bonus, projects_completed, monthly_incentive,
branch, education_level, designation)
VALUES
('Amit Sharma', 'IT', 60000, 'Developer', '2023-01-15', 'Pune', 'Male',
25, 2, 5000, 8, 3000, 'Pune Main', 'B.Tech', 'Software Engineer'),

('Priya Patil', 'HR', 45000, 'HR Executive', '2022-06-10', 'Mumbai', 'Female',
27, 4, 4000, 5, 2000, 'Mumbai Main', 'MBA', 'HR Executive'),

('Rahul Verma', 'Sales', 50000, 'Sales Executive', '2023-03-20', 'Pune', 'Male',
26, 3, 6000, 10, 4000, 'Pune Main', 'B.Com', 'Sales Executive'),

('Sneha Joshi', 'IT', 70000, 'Senior Developer', '2021-08-05', 'Mumbai', 'Female',
30, 6, 8000, 15, 5000, 'Mumbai Main', 'M.Tech', 'Senior Software Engineer'),

('Vikas Singh', 'Finance', 55000, 'Accountant', '2022-11-12', 'Delhi', 'Male',
29, 5, 5000, 7, 2500, 'Delhi Main', 'M.Com', 'Accountant'),

('Neha Kulkarni', 'HR', 48000, 'Recruiter', '2023-05-18', 'Pune', 'Female',
26, 3, 4500, 6, 2200, 'Pune Main', 'MBA', 'HR Recruiter'),

('Rohan Desai', 'Sales', 52000, 'Sales Manager', '2020-09-25', 'Delhi', 'Male',
32, 8, 7000, 18, 4500, 'Delhi Main', 'MBA', 'Sales Manager'),

('Pooja Mehta', 'Finance', 65000, 'Financial Analyst', '2021-12-01', 'Mumbai', 'Female',
31, 7, 7500, 12, 3500, 'Mumbai Main', 'CA', 'Financial Analyst'),

('Karan Shah', 'IT', 58000, 'Tester', '2024-02-14', 'Pune', 'Male',
24, 1, 3500, 6, 1800, 'Pune Main', 'B.Tech', 'QA Engineer'),

('Anjali Gupta', 'Sales', 47000, 'Sales Executive', '2024-04-22', 'Delhi', 'Female',
25, 1, 5000, 9, 3200, 'Delhi Main', 'BBA', 'Sales Executive');

SELECT * FROM employees;

-- 6.	Display the department and the total number of employees in each department.
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 7.	Display the department and the average salary of employees.
SELECT
department,
avg(salary) AS employee_avg_salary
FROM employees
group by department;

-- 8.	Display the department and the total salary paid in each department.
SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 9.	Display the department and the highest salary in each department.
SELECT
    department,
    max(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 10.	Display the department and the lowest salary in each department.
SELECT
    department,
    MIN(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 11.	Display the job role and the total number of employees in each job role.
SELECT 
job_role,
COUNT(*) AS total_number_of_employee
FROM employees
group by job_role;

-- 12.	Display the job role and the average salary.
SELECT
job_role,
avg(salary) AS average_salary
FROM employees
group by job_role;

-- 13.	Display the city and the total number of employees.
SELECT
    city,
    COUNT(*) AS total_employees
FROM employees
GROUP BY city;

-- 14.	Display the city and the total salary paid.
SELECT
city,
SUM(salary) AS total_salary
FROM employees
group by city;

-- 15.	Display the city and the average salary.
SELECT
city,
AVG(salary) AS avrage_salary
FROM employees
group by city;

-- 16.	Display the gender and the total number of employees.
SELECT
gender,
COUNT(*) AS total_employees
FROM employees
group by gender;

-- 17.	Display the gender and the average salary.
SELECT
gender,
avg(salary) AS average_salary
FROM employees
group by gender;

-- 18.	Display the gender and the total salary.
SELECT
gender,
SUM(salary) AS total_salary
FROM employees
group by gender;

-- 19.	Display the department and the maximum employee age.
SELECT
department,
MAX(age) AS maximum_age
FROM employees
group by department;

-- 20.	Display the department and the minimum employee age.
SELECT
    department,
    MIN(age) AS minimum_age
FROM employees
GROUP BY department;

-- 21.	Display the department and the average employee age.
SELECT
    department,
    AVG(age) AS average_age
FROM employees
GROUP BY department;

-- 22.	Display the department and the total experience of employees.
SELECT
    department,
    SUM(experience_years) AS total_experience
FROM employees
GROUP BY department;

-- 23.	Display the department and the average years of experience.
SELECT
    department,
    AVG(experience_years) AS total_experience
FROM employees
GROUP BY department;

-- 24.	Display the department and the total bonus amount.
SELECT
    department,
    SUM(bonus) AS bonus_amount
FROM employees
GROUP BY department;

-- 25.	Display the department and the average bonus amount.
SELECT
    department,
    AVG(bonus) AS bonus_amount
FROM employees
GROUP BY department;

-- 26.	Display the city and the highest salary.
SELECT
    city,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY city;

-- 27.	Display the city and the lowest salary.
SELECT
    city,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY city;

-- 28.	Display the job role and the total salary budget.
SELECT
    job_role,
    SUM(salary) AS total_salary_budget
FROM employees
GROUP BY job_role;

-- 29.	Display the job role and the highest salary.
SELECT
    job_role,
    MAX(salary) AS highest_salary_budget
FROM employees
GROUP BY job_role;

-- 30.	Display the job role and the lowest salary.
SELECT
    job_role,
    MIN(salary) AS highest_salary_budget
FROM employees
GROUP BY job_role;

-- 31.	Display the department and the total number of projects completed.
SELECT
    department,
    SUM(projects_completed) AS total_projects_completed
FROM employees
GROUP BY department;

-- 32.	Display the department and the average project count.
SELECT
    department,
    AVG(projects_completed) AS average_projects_count
FROM employees
GROUP BY department;

-- 33.	Display the department and the total monthly incentive.
SELECT
    department,
    SUM(monthly_incentive) AS total_monthly_incentive
FROM employees
GROUP BY department;

-- 34.	Display the department and the average monthly incentive
SELECT
    department,
    AVG(monthly_incentive) AS average_monthly_incentive
FROM employees
GROUP BY department;

-- 35.	Display the branch and the total number of employees.
SELECT
branch,
count(*) AS total_employees
FROM employees
group by branch;

-- 36.	Display the branch and the average salary.
SELECT
branch,
AVG(salary) AS average_salary
FROM employees
group by branch;

-- 37.	Display the branch and the total salary expenditure.
SELECT
    branch,
    SUM(salary) AS total_salary_expenditure
FROM employees
GROUP BY branch;

-- 38.	Display the education level and the total number of employees.
SELECT
education_level,
count(*) AS total_employees
FROM employees
group by education_level;

-- 39.	Display the education level and the average salary.
SELECT
education_level,
AVG(salary) AS average_salary
FROM employees
group by education_level;

-- 40.	Display the education level and the total salary.
SELECT
    education_level,
    SUM(salary) AS total_salary
FROM employees
GROUP BY education_level;

-- 41.	Display the department and the total number of male and female employees separately.
SELECT
    department,
    SUM(gender = 'Male') AS male_employees,
    SUM(gender = 'Female') AS female_employees
FROM employees
GROUP BY department;

-- 42.	Display the city and the average years of experience.
SELECT
    city,
    AVG(experience_years) AS average_experience
FROM employees
GROUP BY city;

-- 43.	Display the designation and the total number of employees.
SELECT
    designation,
    COUNT(*) AS total_employees
FROM employees
GROUP BY designation;

-- 44.	Display the designation and the total salary.
SELECT
    designation,
    SUM(salary) AS total_salary
FROM employees
GROUP BY designation;

-- 45.	Display the designation and the average salary.
SELECT
    designation,
    AVG(salary) AS average_salary
FROM employees
GROUP BY designation;

-- 46.	Create another table named sales with suitable columns and insert at least 10 records.
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    quantity_sold INT,
    selling_price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales
(product_name, product_category, quantity_sold, selling_price, sale_date)
VALUES
('Laptop', 'Electronics', 5, 55000, '2026-01-10'),
('Mouse', 'Electronics', 20, 500, '2026-01-12'),
('Keyboard', 'Electronics', 10, 1500, '2026-01-15'),
('Monitor', 'Electronics', 8, 12000, '2026-01-18'),
('Notebook', 'Stationery', 30, 100, '2026-02-05'),
('Pen', 'Stationery', 50, 20, '2026-02-08'),
('Chair', 'Furniture', 6, 4500, '2026-02-12'),
('Table', 'Furniture', 4, 7000, '2026-02-15'),
('Headphones', 'Electronics', 12, 2500, '2026-03-01'),
('Bag', 'Accessories', 15, 1200, '2026-03-05');

select * from sales;

-- 47.	Display the product name and the total quantity sold.
SELECT
    product_name,
    SUM(quantity_sold) AS total_quantity_sold
FROM sales
GROUP BY product_name;

-- 48.	Display the product name and the total sales amount.
SELECT
    product_name,
    SUM(quantity_sold * selling_price) AS total_sales_amount
FROM sales
GROUP BY product_name;

-- 49.	Display the product category and the average selling price.
SELECT
    product_category,
    AVG(selling_price) AS average_selling_price
FROM sales
GROUP BY product_category;

-- 50.	Display the product category and the total number of sales records.
SELECT
    product_category,
    COUNT(*) AS total_sales_records
FROM sales
GROUP BY product_category;