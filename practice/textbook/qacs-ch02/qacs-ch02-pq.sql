-- A
-- SELECT *
-- FROM customer;

-- SELECT *
-- FROM item;

-- SELECT *
-- FROM sale;

-- SELECT *
-- FROM sale_item;

-- B
-- SELECT lastname, firstname, phone
-- FROM customer;

-- C
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE firstname = 'John';

-- D
-- SELECT lastname, firstname, phone, saledate, total
-- FROM customer
-- INNER JOIN sale USING (customerid)
-- WHERE total > 100.00;

-- E
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE firstname LIKE 'D%';

-- F
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE lastname LIKE '%ne%';

-- G
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE phone LIKE '_________56%';

-- H
-- SELECT MAX(total) max_sales_total, MIN(total) min_sales_total
-- FROM sale;

-- I
-- SELECT AVG(total) avg_sales_total
-- FROm sale;

-- J
-- SELECT COUNT(*) customer_count
-- FROM customer;

-- K
-- SELECT lastname, firstname
-- FROM customer
-- GROUP BY lastname, firstname;

-- L
-- SELECT lastname, firstname, COUNT(*)
-- FROM customer
-- GROUP BY lastname, firstname;

-- M
SELECT lastname, firstname, phone
FROM customer
WHERE customerid IN (
    SELECT customerid
    FROM sale
    WHERE total > 100.00
    )
ORDER BY lastname, firstname DESC;

-- N
SELECT lastname, firstname, phone
FROM customer C, sale S
WHERE C.customerid = S.customerid
AND S.total > 100.00
ORDER BY lastname, firstname DESC;

-- O*
SELECT lastname, firstname, phone
FROM customer C
INNER JOIN sale S
ON C.customerid = S.customerid
AND S.total > 100.00
ORDER BY lastname, firstname DESC;

-- P
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE customerid IN (
--     SELECT customerid
--     FROM sale
--     WHERE saleid IN (
--         SELECT saleid
--         FROM sale_item
--         WHERE itemid IN (
--             SELECT itemid
--             FROM item
--             WHERE itemdescription = 'Desk Lamp'
--             )
--         )
--     )
-- ORDER BY lastname, firstname DESC;

-- Q
-- SELECT lastname, firstname, phone
-- FROM customer C, sale S, sale_item SI, item I
-- WHERE C.customerid = S.customerid
-- AND S.saleid = SI.saleid
-- AND SI.itemid = I.itemid
-- AND I.itemdescription = 'Desk Lamp'
-- ORDER BY lastname, firstname DESC;

-- R
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN sale S
-- ON C.customerid = S.customerid
-- INNER JOIN sale_item SI
-- ON S.saleid = SI.saleid
-- INNER JOIN item I
-- ON SI.itemid = I.itemid
-- WHERE I.itemdescription = 'Desk Lamp'
-- ORDER BY lastname, firstname DESC;

-- S
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN sale S
-- ON C.customerid = S.customerid
-- INNER JOIN sale_item SI
-- ON S.saleid = SI.saleid
-- WHERE itemid IN (
--     SELECT itemid
--     FROM item
--     WHERE itemdescription = 'Desk Lamp'
--     )
-- ORDER BY lastname, firstname DESC;

-- T
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN sale S
-- ON C.customerid = S.customerid
-- WHERE saleid IN (
--     SELECT saleid
--     FROM sale_item
--     WHERE itemid IN (
--         SELECT itemid
--         FROM item
--         WHERE itemdescription = 'Desk Lamp'
--         )
--     )
-- ORDER BY lastname, firstname DESC;

-- U
-- SELECT lastname, firstname, phone, temp.itemdescription
-- FROM customer C
-- LEFT OUTER JOIN (
--     SELECT S.customerid, I.itemdescription
--     FROM sale S
--     INNER JOIN sale_item SI
--     ON S.saleid = SI.saleid
--     INNER JOIN item I
--     ON SI.itemid = I.itemid
--     WHERE I.itemdescription = 'Desk Lamp'
-- ) temp
-- ON C.customerid = temp.customerid
-- ORDER BY temp.itemdescription, lastname, firstname DESC;

-- V
-- SELECT
--     C1.lastname customer_last_name,
--     C1.firstname customer_first_name,
--     C2.lastname referredby_last_name,
--     C2.firstname referredby_first_name
-- FROM customer C1
-- LEFT OUTER JOIN customer C2
-- ON C1.referredby = C2.customerid;