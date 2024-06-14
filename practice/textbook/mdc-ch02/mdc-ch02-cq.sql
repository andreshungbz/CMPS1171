-- A
-- SELECT *
-- FROM customer;

-- SELECT *
-- FROM invoice;

-- SELECT *
-- FROM invoice_item;

-- B
-- SELECT lastname, firstname, phone
-- FROM customer;

-- C
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE firstname = 'Nikki';

-- D
-- SELECT C.lastname, C.firstname, C.phone, I.datein, I.dateout
-- FROM customer AS C
-- INNER JOIN invoice AS I
-- USING (customerid)
-- WHERE I.totalamount > 100.00;

-- E
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE firstname LIKE 'B%';

-- F
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE lastname LIKE '%cat%';

-- G
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE phone LIKE '_23%';

-- H
-- SELECT MAX(totalamount) AS invoice_max_total_amount, MIN(totalamount) AS invoice_min_total_amount
-- FROM invoice;

-- I
-- SELECT AVG(totalamount) AS invoice_avg_total_amount
-- FROM invoice;

-- J
-- SELECT COUNT(*) AS number_of_customers
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
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE customerid IN (
--     SELECT customerid
--     FROM invoice
--     WHERE totalamount > 100.00
--     )
-- ORDER BY lastname, firstname DESC;

-- N
-- SELECT lastname, firstname, phone
-- FROM customer C, invoice I
-- WHERE C.customerid = I.customerid
-- AND I.totalamount > 100.00
-- ORDER BY lastname, firstname DESC;

-- O
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN invoice I
-- ON C.customerid = I.customerid
-- WHERE I.totalamount > 100.00
-- ORDER BY lastname, firstname DESC;

-- P
-- SELECT lastname, firstname, phone
-- FROM customer
-- WHERE customerid IN (
--     SELECT customerid
--     FROM invoice
--     WHERE invoicenumber IN (
--         SELECT invoicenumber
--         FROM invoice_item
--         WHERE item = 'Dress Shirt'
--         )
--     )
-- ORDER BY lastname, firstname DESC;

-- Q
-- SELECT lastname, firstname, phone
-- FROM customer C, invoice I, invoice_item IT
-- WHERE C.customerid = I.customerid
-- AND I.invoicenumber = IT.invoicenumber
-- AND IT.item = 'Dress Shirt'
-- ORDER BY lastname, firstname DESC;

-- R
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN invoice I
-- ON C.customerid = I.customerid
-- INNER JOIN invoice_item IT
-- ON I.invoicenumber = IT.invoicenumber
-- WHERE IT.item = 'Dress Shirt'
-- ORDER BY lastname, firstname DESC;

-- S
-- SELECT 
--     C1.lastname customer_last_name,
--     C1.firstname customer_first_name,
--     C2.lastname referredby_lastname,
--     C2.firstname referredby_firstname
-- FROM customer C1
-- LEFT OUTER JOIN customer C2
-- ON C1.referredby = C2.customerid;

-- T
-- SELECT lastname, firstname, phone
-- FROM customer C
-- INNER JOIN invoice I USING (customerid)
-- WHERE I.invoicenumber IN (
--     SELECT invoicenumber
--     FROM invoice_item
--     WHERE item = 'Dress Shirt'
--     )
-- ORDER BY lastname, firstname DESC;

-- U
SELECT lastname, firstname, phone, temp.totalamount
FROM customer C
LEFT OUTER JOIN (
    SELECT I.invoicenumber, I.customerid, I.totalamount
    FROM invoice I
    INNER JOIN invoice_item IT
    ON I.invoicenumber = IT.invoicenumber
    WHERE IT.item = 'Dress Shirt'
) temp
ON C.customerid = temp.customerid
ORDER BY temp.totalamount, lastname, firstname DESC;