-- IN

SELECT *
FROM customer
WHERE city IN ('Philadelphia', 'Seattle');

-- BETWEEN

SELECT *
FROM customer
WHERE age BETWEEN 20 AND 30;

SELECT *
FROM customer
WHERE age NOT BETWEEN 20 AND 30;

SELECT *
FROM sales
WHERE ship_date BETWEEN '01-04-2015' AND '01-04-2016';

-- LIKE

SELECT *
FROM customer
WHERE SPLIT_PART(customer_name, ' ', 1) LIKE 'Jo%';

SELECT *
FROM customer
WHERE SPLIT_PART(customer_name, ' ', 1) LIKE '%od%';

SELECT *
FROM customer
WHERE SPLIT_PART(customer_name, ' ', 1) LIKE 'Jas_n';

SELECT *
FROM customer
WHERE SPLIT_PART(customer_name, ' ', 1) NOT LIKE 'J%';

-- ORDER BY

SELECT *
FROM customer
WHERE state = 'California'
ORDER BY customer_name;

SELECT *
FROM customer
WHERE state = 'California'
ORDER BY customer_name ASC;

-- second column
SELECT *
FROM customer
ORDER BY 2 DESC;

SELECT *
FROM customer
WHERE age > 25
ORDER BY city ASC, customer_name DESC;

-- LIMIT

SELECT *
FROM customer
WHERE age >= 25
ORDER BY age DESC
LIMIT 8;

SELECT *
FROM customer
WHERE age >= 25
ORDER BY age ASC
LIMIT 10;

-- ALIAS

SELECT customer_id AS "serial number", customer_name AS name, age AS customer_age
FROM customer;

-- COUNT

SELECT COUNT(*)
FROM sales;

SELECT
	COUNT(order_line) AS "number of products ordered",
	COUNT(DISTINCT order_id) AS "number of orders"
FROM sales WHERE customer_id = 'CG-12520';

-- SUM

SELECT SUM(profit) AS "total profit"
FROM sales;

SELECT SUM(quantity) AS "total quantity"
FROM sales
WHERE product_id = 'FUR-TA-10000577';

-- AVERAGE

SELECT AVG(age) AS "average customer age"
FROM customer;

SELECT AVG(sales * 0.10) AS "average commission value"
FROM sales;

-- MIN, MAX

SELECT MIN(sales) AS min_sales_june15
FROM sales
WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS max_sales_june15
FROM sales
WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

-- using limit
SELECT sales AS max_sales_june15
FROM sales
WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30'
ORDER BY sales DESC
LIMIT 1;

-- GROUP BY

SELECT region, COUNT(customer_id) AS customer_count
FROM customer
GROUP BY region;

SELECT product_id, SUM(quantity) AS quantity_sold
FROM sales
GROUP BY product_id
ORDER BY quantity_sold DESC;

SELECT
	customer_id,
	MIN(sales) AS min_sales,
	MAX(sales) AS max_sales,
	AVG(sales) AS average_sales,
	SUM(sales) AS total_sales
FROM sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- HAVING

SELECT region, COUNT(customer_id) AS customer_count
FROM customer
GROUP BY region
HAVING COUNT(customer_id) > 200;

-- 4 results
SELECT region, COUNT(customer_id) AS customer_count
FROM customer
WHERE customer_name LIKE 'A%'
GROUP BY region;

-- 2 results
SELECT region, COUNT(customer_id) AS customer_count
FROM customer
WHERE customer_name LIKE 'A%'
GROUP BY region
HAVING COUNT(customer_id) > 15;