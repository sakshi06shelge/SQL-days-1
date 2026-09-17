CREATE DATABASE sames_having_demo;
USE sames_having_demo;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    customer_name VARCHAR(50),
    purchase_amount DECIMAL(10,2),
    city VARCHAR(50),
    employee_age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    branch VARCHAR(50),
    designation VARCHAR(50)
);

INSERT INTO sales
(sale_id, product_name, category, quantity, price, customer_name,
 purchase_amount, city, employee_age, department, salary, branch, designation)
VALUES
(1, 'Laptop', 'Electronics', 2, 55000, 'Amit', 110000, 'Pune', 25, 'IT', 65000, 'Pune', 'Developer'),

(2, 'Mouse', 'Accessories', 5, 800, 'Priya', 4000, 'Mumbai', 28, 'HR', 45000, 'Mumbai', 'HR Executive'),

(3, 'Keyboard', 'Accessories', 3, 1500, 'Rahul', 4500, 'Pune', 30, 'IT', 70000, 'Pune', 'Developer'),

(4, 'Monitor', 'Electronics', 2, 12000, 'Sneha', 24000, 'Mumbai', 35, 'Finance', 60000, 'Mumbai', 'Accountant'),

(5, 'Laptop', 'Electronics', 1, 60000, 'Amit', 60000, 'Pune', 25, 'IT', 65000, 'Pune', 'Developer'),

(6, 'Headphones', 'Accessories', 4, 2500, 'Priya', 10000, 'Mumbai', 28, 'HR', 45000, 'Mumbai', 'HR Executive'),

(7, 'Mouse', 'Accessories', 8, 750, 'Rahul', 6000, 'Pune', 30, 'IT', 70000, 'Pune', 'Developer'),

(8, 'Keyboard', 'Accessories', 5, 1800, 'Sneha', 9000, 'Mumbai', 35, 'Finance', 60000, 'Mumbai', 'Accountant'),

(9, 'Monitor', 'Electronics', 3, 11000, 'Amit', 33000, 'Pune', 25, 'IT', 65000, 'Pune', 'Developer'),

(10, 'Headphones', 'Accessories', 2, 3000, 'Priya', 6000, 'Mumbai', 28, 'HR', 45000, 'Mumbai', 'HR Executive'),

(11, 'Laptop', 'Electronics', 2, 55000, 'Rahul', 110000, 'Pune', 30, 'IT', 70000, 'Pune', 'Developer'),

(12, 'Mouse', 'Accessories', 6, 900, 'Sneha', 5400, 'Mumbai', 35, 'Finance', 60000, 'Mumbai', 'Accountant'),

(13, 'Printer', 'Electronics', 2, 18000, 'Amit', 36000, 'Pune', 25, 'IT', 65000, 'Pune', 'Developer'),

(14, 'Laptop', 'Electronics', 1, 65000, 'Priya', 65000, 'Mumbai', 28, 'HR', 45000, 'Mumbai', 'HR Executive'),

(15, 'Printer', 'Electronics', 3, 20000, 'Rahul', 60000, 'Pune', 30, 'IT', 70000, 'Pune', 'Developer');

select * from sales;

-- 6.	Display the product name and total quantity sold for each product.
select 
product_name,
sum(quantity) AS total_quantity
from sales
group by product_name;

-- 7.	Display the product name and total quantity sold for products whose total quantity is greater than 5.
select 
product_name,
sum(quantity) AS total_quantity
from sales
group by product_name
HAVING total_quantity > 5;

-- 8.	Display the product name and total sales amount for products whose total sales amount is greater than 50000.
select
product_name,
sum(quantity * price) as  total_sales
from sales
group by product_name
HAVING total_sales > 50000;

-- 9.	Display the product name and average selling price for products whose average price is greater than 1000.
select 
product_name,
avg(quantity * price) AS average_price
from sales
group by product_name
HAVING average_price >1000;

-- 10.	Display the product name and total number of orders for products that appear more than once.
select
product_name,
count(*) AS total_orders
from sales
group by product_name
HAVING total_orders > 1;

-- 11.	Display the product name and total number of orders for products with at least two orders.
select
product_name,
count(*) AS total_orders
from sales
group by product_name
HAVING count(*) >= 2;

-- 12.	Display the department and total salary for departments whose total salary is greater than 150000.
select
department,
sum(salary) AS department_total_salary
from sales
group by department
HAVING department_total_salary > 150000;

-- 13.	Display the department and average salary for departments whose average salary is greater than 50000.
select 
department,
avg(salary) AS average_salary
from sales
group by department
HAVING average_salary > 50000;

-- 14.	Display the department and employee count for departments having more than two employees.
select
department,
count(*) AS employee
from sales
group by department
HAVING employee > 2;

-- 15.	Display the city and total employees for cities having more than one employee.
select
city,
count(*) AS total_employee
from sales
group by city
having total_employee >1;

-- 16.	Display the category and total quantity sold for categories whose total quantity is greater than 10.
select
category,
sum(quantity) AS total_quantity
from sales
group by category
HAVING total_quantity > 10;

-- 17.	Display the category and total sales amount for categories whose revenue is greater than 100000.
SELECT category,
SUM(quantity * price) AS total_sales_amount
FROM sales
GROUP BY category
HAVING total_sales_amount > 100000;

-- 18.	Display the product name and revenue for products whose total quantity is greater than 2 and total revenue is greater than 20000.
select
product_name,
sum(quantity * price) AS revenue
from sales
group by product_name
HAVING 
revenue > 20000  AND sum(quantity) > 2;

-- 19.	Display the product name and revenue for products whose total quantity is greater than 5 or total revenue is greater than 50000.
select
product_name,
sum(quantity * price) AS revenue
from sales
group by product_name
hAVING sum(quantity) > 5 OR revenue > 50000;

-- 20.	Display the product name and revenue for only selected product names.
select 
product_name,
sum(quantity * price) AS revenue
from sales
where product_name IN ('mouse','monitor','keyboard')
group by product_name;

-- 21.	Display the product name and revenue for products whose revenue falls within a specific range.
select
product_name,
sum(quantity*price) AS revenue
from sales
group by product_name
HAVING revenue between 10000 AND 20000;

-- 22.	Display the product name and revenue for products whose revenue does not fall within a specific range.
select
product_name,
sum(quantity*price) AS revenue
from sales
group by product_name
HAVING revenue NOT BETWEEN 10000 AND 20000;

-- 23.	Display the product name and revenue excluding selected product names.
select
product_name,
sum(quantity * price) AS revenue
from sales
group by product_name
HAVING product_name IN('laptop','printer');

-- 24.	Display the department and average salary for selected departments only
select
department,
avg(salary) AS average_salary
from sales
group by department
having department IN('IT','HR');

-- 25.	Display the department and total salary excluding selected departments.
select
department,
sum(salary) AS total_salary
from sales
group by department
having department IN('HR','Finance');

-- 26.	Display the customer name and total purchase amount for customers whose purchase amount is greater than 25000.
select
customer_name,
sum(purchase_amount) AS total_purchase_amount
from sales
group by customer_name
having total_purchase_amount > 25000;

-- 27.	Display the customer name and total orders for customers having more than one order.
select
customer_name,
count(*) AS total_orders
from sales
group by customer_name
having total_orders > 1;

-- 28.	Display the branch and total employees for branches having more than three employees.
select
branch,
count(*) AS total_employees
from sales
group by branch
having total_employees > 3;

-- 29.	Display the branch and average salary for branches whose average salary is greater than 60000.
select
branch,
avg(salary) AS average_salary
from sales
group by branch
HAVING average_salary > 60000;

-- 30.	Display the city and total salary for cities whose total salary is greater than 300000
select
city,
sum(salary) AS total_salary
from sales
group by city
having total_salary > 300000;

-- 31.	Display the designation and employee count for designations having more than one employee.
select
designation,
count(*) AS employees
from sales
group by designation
having employees > 1;

-- 32.	Display the designation and average salary for designations whose average salary is greater than 45000.
select
designation,
avg(salary) AS average_salary
from sales
group by designation
having average_salary > 45000;

-- 33.	Display the category and total products sold using an alias and filter the result.
select
category,
sum(quantity) AS total_product_sold
from sales
group by category
having total_product_sold > 10;

-- 34.	Display the department and total salary using an alias and filter the result.
SELECT
department,
sum(salary) AS total_salary
from sales
group by department
having total_salary > 100000;

-- 35.	Display the product name and revenue using an alias and arrange the results in descending order.
select
product_name,
sum(quantity*price) AS revenue
from sales
group by product_name
order by revenue DESC;

-- 36.	Display the department and total salary after filtering employee records based on salary.
select
department,
sum(salary) AS total_salary
from sales
where salary > 60000
group by department;

-- 37.	Display the product name and total quantity after filtering records based on price.
select
product_name,
sum(quantity) AS total_quantity
from sales
where price >200
group by product_name;

-- 38.	Display the customer name and total purchase amount after filtering records based on purchase amount.
select
customer_name,
sum(purchase_amount) AS total_purchase_amount
from sales
where purchase_amount > 200000
group by customer_name;

-- 39.	Display the city and employee count after filtering records based on employee age.
select
city,
count(*) AS employees
from sales
where employee_age > 30
group by city;

-- 40.	Display the category and average price after filtering records based on quantity.
select
category,
avg(price) AS average_price
from sales
where quantity  > 2
group by category;

-- 41.	Create another table named employees and insert at least 10 records.

CREATE TABLE employees (
    employee_id INT primary key auto_increment,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    bonus INT,
    experience INT
);
-- Insert 10 records:

INSERT INTO employees 
(employee_name , department , salary , bonus , experience)
 VALUES
( 'Amit', 'IT', 80000, 7000, 6),
( 'Priya', 'IT', 75000, 6000, 5),
( 'Rahul', 'IT', 70000, 8000, 7),
( 'Sneha', 'HR', 60000, 5000, 6),
( 'Neha', 'HR', 55000, 6000, 5),
( 'Rohit', 'Sales', 65000, 7000, 8),
( 'Pooja', 'Sales', 60000, 6000, 6),
( 'Kiran', 'Finance', 70000, 9000, 7),
( 'Vikas', 'Finance', 65000, 8000, 6),
( 'Anjali', 'Finance', 60000, 7000, 5);

select * from employees;

-- 42.	Display the department and total salary for departments whose total salary is greater than 200000
select
department,
sum(salary) AS total_salary
from employees
group by department
having total_salary > 200000;

-- 43.	Display the department and average salary for departments whose average salary is greater than 55000.
select
department,
avg(salary) AS average_salary
from employees
group by department
having average_salary > 55000;

-- 44.	Display the department and employee count for departments having more than three employees.
select
department,
count(*) AS employee_count
from employees
group by department
having count(*) > 3;

-- 45.	Display the department and maximum salary for departments whose maximum salary is greater than 70000.
select
department,
max(salary) AS maximum_salary
from employees
group by department
having maximum_salary > 70000;

-- 46.	Display the department and minimum salary for departments whose minimum salary is greater than 30000.
select
department,
min(salary) AS minimum_salary
from employees
group by department
having minimum_salary > 30000;

-- 47.	Display the department and total bonus for departments whose total bonus is greater than 50000.
select
department,
sum(bonus) AS total_bonus
from employees
group by department
having total_bonus > 5000;

-- 48.	Display the department and average bonus for departments whose average bonus is greater than 5000.
select
department,
avg(bonus) AS average_bonus
from employees
group by department
having average_bonus > 5000;

-- 49.	Display the department and total experience for departments whose total experience is greater than 20 years.
select
department,
sum(experience) AS total_experience
from employees
group by department
having total_experience > 20;

-- 50.	Display the department and average experience for departments whose average experience is greater than 5 years.
select
department,
avg(experience) As average_experience
from employees
group by department
having average_experience;
