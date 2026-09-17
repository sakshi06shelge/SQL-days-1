CREATE DATABASE exists_demo_practice;
USE exists_demo_practice;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
(1, 'Amit', 'Pune'),
(2, 'Neha', 'Mumbai'),
(3, 'Ravi', 'Delhi'),
(4, 'Priya', 'Pune'),
(5, 'Kiran', 'Nagpur'),
(6, 'Sneha', 'Nashik'),
(7, 'Rahul', 'Mumbai'),
(8, 'Pooja', 'Pune'),
(9, 'Akash', 'Delhi'),
(10, 'Riya', 'Nagpur');

select * from customers;

INSERT INTO orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2026-09-01', 1500),
(102, 2, '2026-09-02', 2300),
(103, 1, '2026-09-03', 800),
(104, 4, '2026-09-04', 1200),
(105, 5, '2026-09-05', 900),
(106, 7, '2026-09-06', 1800),
(107, 4, '2026-09-07', 2500),
(108, 9, '2026-09-08', 1100),
(109, 2, '2026-09-09', 700),
(110, 7, '2026-09-10', 3000);

SELECT * FROM orders;

-- 8.	Display the names of customers who have placed at least one order using the EXISTS clause.
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- 9.	Display the names of customers who have not placed any orders using the NOT EXISTS clause.
SELECT customer_name
FROM customers c
WHERE NOT EXISTS(
SELECT 1
FROM orders o
WHERE o.customer_id = c.customer_id);

-- 10.	Display the customer IDs of customers who have at least one order using the EXISTS clause.
SELECT customer_id
FROM customers c
WHERE EXISTS(
SELECT 1
FROM orders o
WHERE o.customer_id = c.customer_id);

-- 11.	Display the customer IDs of customers who do not have any orders using the NOT EXISTS clause.
SELECT customer_id
FROM customers c
WHERE  NOT EXISTS(
SELECT 1
FROM orders o 
WHERE o.customer_id = c.customer_id
);

-- 12.	Create another table named students with appropriate columns.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50)
);

-- 13.	Create another table named enrollments with appropriate columns.
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100)
);

-- 14.	Insert at least 10 records into both tables.
INSERT INTO students (student_id, student_name, city)
VALUES
(1, 'Sakshi', 'Pune'),
(2, 'Rutuja', 'Mumbai'),
(3, 'Amit', 'Delhi'),
(4, 'Rahul', 'Pune'),
(5, 'Sneha', 'Nashik'),
(6, 'Karan', 'Nagpur'),
(7, 'Pooja', 'Mumbai'),
(8, 'Akash', 'Pune'),
(9, 'Neha', 'Delhi'),
(10, 'Riya', 'Nagpur');
SELECT * FROM students;

INSERT INTO enrollments (enrollment_id, student_id, course_name)
VALUES
(201, 1, 'Java'),
(202, 2, 'Python'),
(203, 1, 'SQL'),
(204, 4, 'Web Development'),
(205, 5, 'Python'),
(206, 6, 'Java'),
(207, 7, 'SQL'),
(208, 4, 'Python'),
(209, 9, 'Data Analytics'),
(210, 2, 'Java');
SELECT * FROM enrollments;

-- 15.	Display the names of students who are enrolled in at least one course using the EXISTS clause.
SELECT student_name
FROM students s
WHERE EXISTS(
SELECT 1
FROM enrollments e
WHERE s.student_id = e.student_id);

-- 16.	Display the names of students who are not enrolled in any course using the NOT EXISTS clause.
SELECT student_name
FROM students s
WHERE NOT EXISTS(
SELECT 1
FROM enrollments e
WHERE s.student_id = e.student_id
);

-- 17.	Create another table named products with appropriate columns.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- 18.	Create another table named sales with appropriate columns.
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 55000),
(2, 'Mobile', 25000),
(3, 'Keyboard', 1500),
(4, 'Mouse', 800),
(5, 'Monitor', 12000),
(6, 'Printer', 15000),
(7, 'Headphones', 2500),
(8, 'Webcam', 3500),
(9, 'Tablet', 22000),
(10, 'Speaker', 4000);
SELECT * FROM products;

INSERT INTO sales (sale_id, product_id, quantity, sale_date)
VALUES
(301, 1, 2, '2026-09-01'),
(302, 2, 3, '2026-09-02'),
(303, 3, 5, '2026-09-03'),
(304, 1, 1, '2026-09-04'),
(305, 5, 2, '2026-09-05'),
(306, 7, 4, '2026-09-06'),
(307, 2, 1, '2026-09-07'),
(308, 9, 2, '2026-09-08'),
(309, 3, 3, '2026-09-09'),
(310, 6, 1, '2026-09-10');

SELECT * FROM sales;

-- 19.	Display the product names that have at least one sales record using the EXISTS clause.
SELECT product_name
FROM products p
WHERE EXISTS(
SELECT 1
FROM sales s
WHERE p.product_id = s.product_id);

-- 20.	Display the product names that do not have any sales records using the NOT EXISTS clause.
SELECT product_name
FROM products p
WHERE NOT EXISTS(
SELECT 1
FROM sales s
WHERE p.product_id = s.product_id);

