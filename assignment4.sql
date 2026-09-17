CREATE SCHEMA IF NOT EXISTS sales_management;
USE sales_management;

CREATE TABLE products(
Product_id INT PRIMARY KEY auto_increment,
product_name VARCHAR(100),
quantity INT,
Unit_price DECIMAL(10,2),
discount INT,
purchase_date DATE
);

-- 3.	Insert at least 8 records into the products table.
INSERT INTO products
(product_name, quantity, Unit_price, discount, purchase_date)
VALUES
('Laptop', 2, 55000, 10, '2026-08-15'),
('Smartphone', 3, 25000, 5, '2026-06-20'),
('Tablet', 4, 18000, 8, '2026-04-10'),
('Monitor', 5, 12000, 10, '2026-01-25'),
('Keyboard', 10, 2500, 5, '2025-12-15'),
('Printer', 2, 22000, 12, '2025-08-05'),
('Headphones', 6, 4500, 5, '2025-03-18'),
('Office Chair', 3, 15000, 15, '2024-12-10');
-- 4.	Display all the records from the products table.
SELECT * FROM products;
-- 5.	Display the product name along with the total amount for each purchase.
 SELECT 
 product_name,
 quantity * Unit_price AS Total_amount
 FROM products;
 
 -- 6.	Display the product name, unit price, discount, and the final amount after applying the discount.
 SELECT
     product_name,
     Unit_price,
     discount,
	 Unit_price - (Unit_price *  discount / 100) AS Price_After_Discount
FROM products;

-- 7. Quantity, unit price, total purchase value
SELECT
quantity,
Unit_price,
quantity * Unit_price AS Total_purchase_value 
FROM products;

-- 8.Display only those records where the total purchase value is greater than 30000.
 SELECT * FROM 
 products WHERE quantity * Unit_price > 30000;
 
 -- 9.	Display only those products whose purchase amount is greater than 10000.
 SELECT * FROM 
 products WHERE quantity * Unit_price > 10000;
 
 -- 10.	Display the product name and calculate the amount payable after reducing the discount.
 SELECT
    product_name,
    ((quantity * unit_price) * discount / 100) AS Amount_Payable
FROM products;

-- 11. Purchase date falls within the recent period
 SELECT * FROM products
WHERE purchase_date > DATE_SUB(CURDATE(), INTERVAL 30 day); 

-- 12. Purchased within the last one year
SELECT * FROM products
WHERE purchase_date >= DATE_SUB(CURDATE(), INTERVAL 1 year); 

-- 13. Purchased within the last six months
SELECT * FROM products
WHERE purchase_date >= DATE_SUB(CURDATE(), INTERVAL 6 month);

-- 14. Product names in uppercase + unit prices
SELECT 
upper(product_name) as product_name,
Unit_price
FROM products;

-- 15. Product name + equal monthly payment

SELECT
    product_name,
        ((quantity * unit_price) * discount / 100)/ 12 AS Monthly_Payment
FROM products;

-- 16.	Display the product name and calculate the quarterly payment amount.
SELECT
    product_name,
    (quantity * unit_price) / 4 AS quarterly_payment
FROM products;

-- 17.	Display the product name and determine whether its unit price satisfies a given condition.
SELECT
product_name,unit_price > 500 AS price_condition
FROM products;

-- 18.	Display the product name, total purchase amount, and the final payable amount.
SELECT
    product_name,
    quantity * unit_price AS total_purchase_amount,
    (quantity * unit_price) -
    (quantity * unit_price * discount / 100) AS final_payable_amount
FROM products;

-- 19.	Display only those records where the calculated payable amount exceeds 25000.
SELECT *
FROM products
WHERE
    (quantity * unit_price) -
    (quantity * unit_price * discount / 100) > 25000;
    
    -- 20.	Display the product name, quantity, and the calculated purchase value using meaningful output column names.
    SELECT
    product_name AS Product,
    quantity AS Quantity,
    quantity * unit_price AS Purchase_Value
FROM products;

-- 21.	Display the product name and calculate the tax amount equal to 18% of the unit price.
SELECT 
product_name,
Unit_price * 18 / 100 AS tax_amount
FROM products;

-- 22.	Display the product name along with the amount after adding a fixed percentage as tax.
SELECT
    product_name,
    unit_price,
    unit_price + (unit_price * 18 / 100) AS amount_with_tax
FROM products;

-- 23.	Display the product name, quantity, and the average cost per item based on the purchase value.
SELECT
    product_name,
    quantity,
    (quantity * unit_price) / quantity AS average_cost_per_item
FROM products;

-- 24.	Display only those products whose calculated purchase value is less than 15000.
SELECT *
FROM products
WHERE quantity * unit_price < 15000;

-- 25.	Display the product name, purchase date, and determine whether the purchase is within the recent period.

SELECT 
product_name,
purchase_date,
purchase_date > date_sub(curdate(), interval 10 day) AS resent_purchase
 FROM products;
-- 26. Product name in uppercase and discounted amount
SELECT
    UPPER(product_name) AS product_name,
    quantity * unit_price * discount / 100 AS discounted_amount
FROM products;

-- 27.	Display the product name along with the difference between the original amount and the discounted amount.
SELECT product_name,
unit_price * discount / 100 AS discount_amount
FROM products;

-- 28.	Display the product name, quantity, unit price, total purchase value, and final payable amount.
SELECT
    product_name,
    quantity,
    unit_price,
    quantity * unit_price AS total_purchase_value,
    (quantity * unit_price) -
    (quantity * unit_price * discount / 100) AS final_payable_amount
FROM products;

-- 29.	Display the product name and determine whether the product belongs to the high-price category based on its unit price.
SELECT product_name,
unit_price >= 500 AS high_price
FROM products;

-- 30.	Create a new table named inventory, insert at least 6 records, and write queries to:
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    purchase_date DATE
);


INSERT INTO inventory
(inventory_id, item_name, quantity, unit_price, discount, purchase_date)
VALUES
(1, 'Office Chair', 5, 7000, 10, '2026-01-10'),
(2, 'Desk', 3, 12000, 5, '2026-02-15'),
(3, 'Mouse', 15, 1500, 8, '2026-04-20'),
(4, 'Printer Ink', 10, 2500, 5, '2025-12-10'),
(5, 'USB Drive', 20, 1000, 10, '2026-06-05'),
(6, 'Webcam', 6, 6000, 12, '2025-09-18');
-- Display all records.
SELECT * FROM inventory;
-- Calculate the total value for each record.
SELECT 
item_name,
quantity,
Unit_price,
quantity * unit_price AS total_value
FROM inventory;
-- Calculate the payable amount after discount
SELECT
     item_name,
     Unit_price,
     discount,
     unit_price- (unit_price *  discount  / 100) AS payable_amount
FROM inventory;
-- Display records based on calculated values.
SELECT * FROM inventory
WHERE (quantity * unit_price * discount / 100) > 20000;
-- Display records based on purchase dates.
SELECT *
FROM inventory
WHERE purchase_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
-- Display text values in uppercase.
SELECT 
upper(item_name) AS ITEM_NAME
FROM inventory;
-- Calculate installment amounts.
SELECT 
item_name,
quantity * unit_price / 12 AS monthly_installment
FROM inventory;
-- Display the result of a logical condition for each record.
