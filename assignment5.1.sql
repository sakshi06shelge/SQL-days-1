CREATE DATABASE orderby_assignment;
USE orderby_assignment;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    purchase_date DATE
);

INSERT INTO products
(product_name, category, quantity, price, purchase_date)
VALUES
('Laptop', 'Electronics', 5, 55000.00, '2025-01-15'),
('Mouse', 'Electronics', 20, 500.00, '2025-02-10'),
('Keyboard', 'Electronics', 10, 1500.00, '2025-01-25'),
('Monitor', 'Electronics', 8, 12000.00, '2025-03-05'),
('Notebook', 'Stationery', 30, 100.00, '2025-02-18'),
('Pen', 'Stationery', 50, 20.00, '2025-01-08'),
('Chair', 'Furniture', 6, 4500.00, '2025-04-12'),
('Table', 'Furniture', 4, 7000.00, '2025-03-20'),
('Headphones', 'Electronics', 12, 2500.00, '2025-04-05'),
('Bag', 'Accessories', 15, 1200.00, '2025-02-28');

select * from products;

-- 6.	Display all products sorted by price in ascending order.
SELECT * 
FROM products
order by price ASC;

-- 7.	Display all products sorted by price in descending order.
SELECT * 
FROM products
order by price DESC;

-- 8.	Display all products sorted by product name in ascending order.
SELECT * from
products
order by product_name ASC;

-- 9.	Display all products sorted by product name in descending order.
SELECT * from
products
order by product_name DESC;

-- 10.	Display all products sorted by quantity in ascending order.
SELECT *
FROM products
ORDER BY quantity ASC;

-- 11.	Display all products sorted by quantity in descending order.
SELECT *
FROM products
ORDER BY quantity DESC;

-- 12.	Display all products sorted first by category and then by price.
SELECT *
FROM products
ORDER BY category ASC, price ASC;

-- 13.	Display all products sorted first by category in descending order and then by quantity in ascending order.
SELECT *
FROM products
ORDER BY category DESC, quantity ASC;

-- 14.	Display the product name and total amount for each record, sorted by the total amount.
SELECT
product_name,
quantity * price AS total_amount
FROM  products
ORDER BY total_amount DESC;

-- 15.	Display the product name and total amount sorted from the smallest value to the largest value.
SELECT
    product_name,
    quantity * price AS total_amount
FROM products
ORDER BY total_amount ASC;

-- 16.	Display all product names in uppercase and sort them alphabetically.
SELECT UPPER(product_name) AS product_name
FROM products
ORDER BY product_name ASC;

-- 17.	Display all product names in lowercase and sort them alphabetically.
SELECT LOWER(product_name) AS product_name
FROM products
ORDER BY product_name ASC;

-- 18.	Display the length of each product name and sort the records by the name length.
SELECT length(product_name) AS product_name
FROM products
ORDER BY product_name ASC;

-- 19.	Display all products sorted by the longest product name first.
SELECT *
FROM products
ORDER BY LENGTH(product_name) DESC;

-- 20.	Display all products sorted by the shortest product name first
SELECT *
FROM products
ORDER BY LENGTH(product_name) ASC;

-- 21.	Display all records sorted by purchase date in ascending order.
SELECT *
FROM products
ORDER BY purchase_date ASC;

-- 22.	Display all records sorted by purchase date in descending order.
SELECT *
FROM products
ORDER BY purchase_date DESC;

-- 23.	Display all records sorted by purchase date and then by product name.
SELECT *
FROM products
ORDER BY purchase_date ASC , product_name ASC;

-- 24.	Display the purchase month for every record and sort the records by month.
SELECT
    product_name,
    purchase_date,
    MONTH(purchase_date) AS purchase_month
FROM products
ORDER BY purchase_month ASC;

-- 25.	Display the purchase year for every record and sort the records by year.
SELECT
    product_name,
    purchase_date,
    YEAR(purchase_date) AS purchase_year
FROM products
ORDER BY purchase_year ASC;

-- 26.	Display the purchase year and month for every record and sort the records accordingly.
SELECT
    product_name,
    purchase_date,
    YEAR(purchase_date) AS purchase_year,
    MONTH(purchase_date) AS purchase_month
FROM products
ORDER BY purchase_year ASC, purchase_month ASC;

-- 27.	Display the number of days since each purchase and sort the records by that value.
SELECT
product_name,
    purchase_date,
       DATEDIFF(CURDATE(), purchase_date) AS days_since_purchase
FROM products
ORDER BY days_since_purchase ASC;

-- 28.	Display the purchase date in a formatted style and sort the records by the original date.
SELECT
    product_name,
    DATE_FORMAT(purchase_date, '%d-%m-%Y') AS formatted_date
FROM products
ORDER BY purchase_date ASC;

-- 29.	Display the purchase month and year in a formatted format and sort the records correctly.
SELECT
    product_name,
    DATE_FORMAT(purchase_date, '%M-%Y') AS purchase_month_year
FROM products
ORDER BY purchase_date ASC;

-- 30.	Display the total number of products available in each category.
SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category;

-- 31.	Display the total quantity sold for each category.
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM products
GROUP BY category;

-- 32.	Display the total revenue generated for each category.
SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM products
GROUP BY category;

-- 33.	Display the average product price for each category.
SELECT
    category,
    AVG(price) AS total_products
FROM products
GROUP BY category;

-- 34.	Display the highest product price in each category.
SELECT
    category,
    MAX(price) AS highest_price
FROM products
GROUP BY category;

-- 35.	Display the lowest product price in each category.
SELECT
    category,
    MIN(price) AS lowest_price
FROM products
GROUP BY category;

-- 36.	Display the product category and total revenue, sorted by total revenue.
SELECT
    category,
    SUM(quantity * price) AS total_revenue
FROM products
GROUP BY category
ORDER BY total_revenue ASC;

-- 37.	Display the product category and total quantity sold, sorted by quantity.
SELECT
    category,
    SUM(quantity) AS total_quantity
FROM products
GROUP BY category
ORDER BY total_quantity ASC;

-- 38.	Display the product name, total amount, and GST amount for every record.
SELECT
    product_name,
    quantity * price AS total_amount,
    (quantity * price) * 0.18 AS gst_amount
FROM products;

-- 39.	Display the product name, total amount, GST amount, and category label based on price.
SELECT
    product_name,
    quantity * price AS total_amount,
    (quantity * price) * gst / 100 AS gst_amount,
    CASE
        WHEN price >= 70000 THEN 'high'
        WHEN price >= 50000 THEN 'medium'
        ELSE 'low'
    END AS category_label
FROM products;

-- 40.	Display all records sorted by total amount in descending order.
SELECT * 
FROM products
ORDER BY price*quantity DESC;

-- 41.	Display all records sorted by GST amount in ascending order.
SELECT * 
FROM products
ORDER BY quantity * price * 18 / 100  ASC;

-- 42.	Display all products whose details are arranged alphabetically after converting the names to uppercase.
SELECT *
FROM products
ORDER BY UPPER(product_name) ASC;

-- 43.	Display all products ordered by the number of characters in the product name and then by price.
SELECT * FROM products
order by length(product_name),price;

-- 44.	Display all records ordered by year, month, and purchase date.
SELECT * FROM products
order by year(purchase_date),month(purchase_date),purchase_date;

-- 45.	Display all records sorted by category, product name, and price.
SELECT * FROM products
order by category asc, product_name asc, price asc;

-- 46.	Create another table named orders with appropriate columns and insert at least 10 records.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders
(order_id, customer_name, product_name, quantity, order_date, total_amount)
VALUES
(1, 'Amit', 'Laptop', 1, '2026-08-20', 55000),
(2, 'Priya', 'Mouse', 2, '2026-08-22', 1000),
(3, 'Rahul', 'Keyboard', 1, '2026-08-24', 1500),
(4, 'Amit', 'Monitor', 1, '2026-08-26', 12000),
(5, 'Sneha', 'Headphones', 2, '2026-08-28', 5000),
(6, 'Priya', 'Laptop', 1, '2026-08-30', 55000),
(7, 'Rahul', 'Mouse', 3, '2026-09-01', 1500),
(8, 'Amit', 'Keyboard', 2, '2026-09-03', 3000),
(9, 'Sneha', 'Monitor', 1, '2026-09-05', 12000),
(10, 'Priya', 'Headphones', 2, '2026-09-07', 5000);

select * from orders;
-- 47.	Display all records from the orders table sorted by order date.
select * from orders
order by order_date;

-- 48.	Display the customer name and total bill amount for each order sorted by the bill amount.
SELECT customer_name, total_amount
FROM orders
ORDER BY total_amount;

-- 49.	Display the total order amount for each customer and sort the result in descending order.
select customer_name,
sum(total_amount) AS total_order_amount
from orders
group by customer_name
order by total_order_amount desc;

-- 50.	Display the number of orders placed by each customer and sort the customers by the number of orders.
select customer_name,
count(*) AS number_of_orders
from orders
group by customer_name
order by number_of_orders DESC;
