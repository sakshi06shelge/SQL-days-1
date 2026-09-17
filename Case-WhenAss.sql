CREATE DATABASE case_when_practice;
USE case_when_practice;

CREATE TABLE products (
    product_id INT PRIMARY KEY auto_increment,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products ( product_name, category, price)
VALUES
( 'Laptop', 'Electronics', 75000),
( 'Smartphone', 'Electronics', 45000),
( 'Television', 'Electronics', 55000),
( 'Office Chair', 'Furniture', 15000),
( 'Dining Table', 'Furniture', 40000),
( 'Sofa', 'Furniture', 80000),
( 'Jacket', 'Clothing', 12000),
( 'Designer Dress', 'Clothing', 25000),
( 'Washing Machine', 'Electronics', 30000),
( 'Headphones', 'Electronics', 5000);

SELECT * FROM products;

-- 4.	Display only the product_name and price columns.
SELECT product_name,price
FROM products;

-- 5.	Use CASE WHEN to classify products based on their price:
-- Price >= 50,000 → Premium
-- Price >= 20,000 → Mid Range
-- Otherwise → Budget
SELECT
product_name,
price,
CASE
WHEN price >= 50000 THEN 'Premium'
WHEN price >= 20000 THEN 'Mid Range'
ELSE 'Budget'
END AS price_category
FROM products;

SELECT 
product_name,
price,
 CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END AS Price_Category
FROM products;

-- 8.	Count how many products belong to each Price_Category.
SELECT
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END AS Price_Category,
    COUNT(*) AS Total_Products
FROM products
GROUP BY
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END;

-- 9.	Find the average price of products in each Price_Category.
SELECT
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END AS Price_Category,
    AVG(price) AS Average_Price
FROM products
GROUP BY
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END;
    
    -- 10.	Find the highest-priced product in each Price_Category.
    
    SELECT
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END AS Price_Category,
    MAX(price) AS Highest_Price
FROM products
GROUP BY
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END;
    
-- 11.	Find the lowest-priced product in each Price_Category.
  SELECT
  CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
	END AS proce_Category,
    MIN(price) AS minimum_price
    FROM products
    group by
    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
	END;
    
    -- 12.	Use CASE WHEN to classify products based on their category:
-- Electronics → Technology
-- Furniture → Home
-- Clothing → Fashion
-- Any other category → Other
SELECT
product_name,
category,
CASE
    WHEN category = 'Electronics' THEN 'Technology'
    WHEN category = 'Furniture' THEN 'Home'
    WHEN category = 'Clothing' THEN 'Fashion'
    ELSE 'Other'
    END AS category_group
    FROM products;

-- 12.	Count the number of products in each newly created category group.

SELECT
    CASE
        WHEN category = 'Electronics' THEN 'Technology'
        WHEN category = 'Furniture' THEN 'Home'
        WHEN category = 'Clothing' THEN 'Fashion'
        ELSE 'Other'
    END AS Category_Group,
    COUNT(*) AS Total_Products
FROM products
GROUP BY
    CASE
        WHEN category = 'Electronics' THEN 'Technology'
        WHEN category = 'Furniture' THEN 'Home'
        WHEN category = 'Clothing' THEN 'Fashion'
        ELSE 'Other'
    END;
    
 -- 13.	Use CASE WHEN to identify whether each product is Expensive or Affordable:
-- Price >= 30,000 → Expensive
-- Otherwise → Affordable
   SELECT
    product_name,
    price,
    CASE
        WHEN price >= 30000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS Price_Status
FROM products;

-- 14.	Count the number of Expensive and Affordable products.
SELECT
    CASE
        WHEN price >= 30000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS Price_Status,
    COUNT(*) AS Total_products
FROM products
GROUP BY
CASE
        WHEN price >= 30000 THEN 'Expensive'
        ELSE 'Affordable'
END;

-- 15.	Find the average price of Expensive products and Affordable products separately.
SELECT
    CASE
        WHEN price >= 30000 THEN 'Expensive'
        ELSE 'Affordable'
    END AS Price_Status,
    AVG(price) AS Average_price
FROM products
GROUP BY
CASE
        WHEN price >= 30000 THEN 'Expensive'
        ELSE 'Affordable'
END;

-- 16.	Create a CASE WHEN classification using multiple conditions:
-- Price >= 50,000 → High Value
-- Price between 20,000 and 49,999 → Medium Value
-- Price below 20,000 → Low Value
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Category
FROM products;

-- 17.	Display the number of products available under each value category.
SELECT
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Category,
    COUNT(*) AS Total_Products
FROM products
GROUP BY
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END;
    
    -- 18.	Find the total price of products belonging to each value category.
    SELECT
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Category,
    SUM(price) AS Total_price
FROM products
GROUP BY
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END;
    
-- 19.	Find the average price of products for each original category.
SELECT
category,
AVG(price) AS Average_Price
FROM products
GROUP BY category;

-- 20.	Display the product name, category, price, and a calculated column called Price_Status using CASE WHEN.
SELECT
    product_name,
    category,
    price,
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Price_Status
FROM products;

-- 21.	Display only those products whose calculated Price_Status is High Value.
SELECT
    product_name,
    category,
    price,
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Price_Status
FROM products
WHERE price >= 50000;

-- 22.	Group the products based on the CASE WHEN price classification and calculate:
-- Number of products
-- Average price
-- Maximum price
-- Minimum price
SELECT
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Category,
    
    COUNT(*) AS Total_Products,
    AVG(price) AS Average_Price,
    MAX(price) AS Maximum_Price,
    MIN(price) AS Minimum_Price

FROM products

GROUP BY
    CASE
        WHEN price >= 50000 THEN 'High Value'
        WHEN price >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END;
    
    -- 23.	Create a CASE WHEN classification with three levels based on price and determine how many products fall into each level.
    SELECT
    CASE
        WHEN price >= 50000 THEN 'High'
        WHEN price >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS Price_Level,
    
    COUNT(*) AS Total_Products

FROM products

GROUP BY
    CASE
        WHEN price >= 50000 THEN 'High'
        WHEN price >= 20000 THEN 'Medium'
        ELSE 'Low'
    END;
    
    -- 24.	Find the category having the highest average product price.
SELECT
category,
AVG(price) AS Average_Price
FROM products
GROUP BY category
ORDER BY Average_Price DESC
LIMIT 1;

-- 25.	Create a report showing:
-- Product name
-- Category
-- Price
-- Price Grade
-- Total number of products in that Price Grade
SELECT
    product_name,
    category,
    price,

    CASE
        WHEN price >= 75000 THEN 'Luxury'
        WHEN price >= 40000 THEN 'Premium'
        WHEN price >= 15000 THEN 'Standard'
        ELSE 'Budget'
    END AS Price_Grade,

    COUNT(*) OVER (
        PARTITION BY
        CASE
            WHEN price >= 75000 THEN 'Luxury'
            WHEN price >= 40000 THEN 'Premium'
            WHEN price >= 15000 THEN 'Standard'
            ELSE 'Budget'
        END
    ) AS Total_Products_In_Grade

FROM products;