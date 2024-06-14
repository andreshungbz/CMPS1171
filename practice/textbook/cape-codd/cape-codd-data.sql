/********************************************************************************/
/*																			    */
/*	Kroenke, Auer, and Vandenberg												*/								
/*	Database Processing (16th Edition) Chapter 02								*/
/*																				*/
/*	Cape Codd Outdoor Sports - Insert Data										*/
/*																				*/
/*	These are the Microsoft SQL Server 2017/2019 SQL code solutions				*/
/*																				*/
/********************************************************************************/


-- BUYER Data

INSERT INTO BUYER VALUES (
	'Mary Smith', 'Purchasing', 'Manager', NULL);
INSERT INTO BUYER VALUES (
	'Pete Hansen', 'Purchasing', 'Buyer 3', 'Mary Smith');
INSERT INTO BUYER VALUES (
	'Nancy Meyers', 'Purchasing', 'Buyer 1', 'Pete Hansen');
INSERT INTO BUYER VALUES (
	'Cindy Lo', 'Purchasing', 'Buyer 2', 'Mary Smith');
INSERT INTO BUYER VALUES (
	'Jerry Martin', 'Purchasing', 'Buyer 1', 'Cindy Lo');

-- RETAIL_ORDER Data

INSERT INTO RETAIL_ORDER VALUES (
	1000, 10, '98110', 'December', 2020, 445.00);
INSERT INTO RETAIL_ORDER VALUES (
	2000, 20, '02335', 'December', 2020, 310.00);
INSERT INTO RETAIL_ORDER VALUES (
	3000, 10, '98110', 'January', 2021, 480.00);

-- SKU_DATA Data

INSERT INTO SKU_DATA VALUES (
	100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100500, 'Std. Scuba Tank, Light Green', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	201000, 'Half-dome Tent', 'Camping', 'Cindy Lo');		
INSERT INTO SKU_DATA VALUES (
	202000, 'Half-dome Tent Vestibule', 'Camping', 'Cindy Lo');
INSERT INTO SKU_DATA VALUES (
	203000, 'Half-dome Tent Vestibule - Wide', 'Camping', 'Cindy Lo');
INSERT INTO SKU_DATA VALUES (
	301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin');		
INSERT INTO SKU_DATA VALUES (
	302000, 'Locking Carabiner, Oval', 'Climbing', 'Jerry Martin');	

-- ORDER_ITEM Data

INSERT INTO ORDER_ITEM VALUES (
	1000, 201000, 1, 300.00, 300.00);
INSERT INTO ORDER_ITEM VALUES (
	1000, 202000, 1, 130.00, 130.00);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101100, 4, 50.00, 200.00);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101200, 2, 50.00, 100.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 100200, 1, 300.00, 300.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101100, 2, 50.00, 100.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101200, 1, 50.00, 50.00);

-- WAREHOUSE Data
						
INSERT INTO WAREHOUSE VALUES (
	100, 'Atlanta', 'GA','Dave Jones', 125000);
INSERT INTO WAREHOUSE VALUES (
	200, 'Chicago', 'IL', 'Lucille Smith', 100000);
INSERT INTO WAREHOUSE VALUES (
	300, 'Bangor', 'ME', 'Bart Evans', 150000);
INSERT INTO WAREHOUSE VALUES (
	400, 'Seattle', 'WA','Dale Rogers', 130000);
INSERT INTO WAREHOUSE VALUES (
	500, 'San Francisco', 'CA','Grace Jefferson', 200000);
		
	
-- INVENTORY Data

INSERT INTO INVENTORY VALUES (
	100, 100100, 'Std. Scuba Tank, Yellow', 250, 0);
INSERT INTO INVENTORY VALUES (
	200, 100100, 'Std. Scuba Tank, Yellow', 100, 50);
INSERT INTO INVENTORY VALUES (
	300, 100100, 'Std. Scuba Tank, Yellow', 100, 0);
INSERT INTO INVENTORY VALUES (
	400, 100100, 'Std. Scuba Tank, Yellow', 200, 0);
INSERT INTO INVENTORY VALUES (
	100, 100200, 'Std. Scuba Tank, Magenta', 200, 30);
INSERT INTO INVENTORY VALUES (
	200, 100200, 'Std. Scuba Tank, Magenta', 75, 75);
INSERT INTO INVENTORY VALUES (
	300, 100200, 'Std. Scuba Tank, Magenta', 100, 100);
INSERT INTO INVENTORY VALUES (
	400, 100200, 'Std. Scuba Tank, Magenta', 250, 0);
INSERT INTO INVENTORY VALUES (
	100, 101100, 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	200, 101100, 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	300, 101100, 'Dive Mask, Small Clear', 300, 200);
INSERT INTO INVENTORY VALUES (
	400, 101100, 'Dive Mask, Small Clear', 450, 0);
INSERT INTO INVENTORY VALUES (
	100, 101200, 'Dive Mask, Med Clear', 100, 500);
INSERT INTO INVENTORY VALUES (
	200, 101200, 'Dive Mask, Med Clear', 50, 500);
INSERT INTO INVENTORY VALUES (
	300, 101200, 'Dive Mask, Med Clear', 475, 0);
INSERT INTO INVENTORY VALUES (
	400, 101200, 'Dive Mask, Med Clear', 250, 250);
INSERT INTO INVENTORY VALUES (
	100, 201000, 'Half-dome Tent', 2, 100);
INSERT INTO INVENTORY VALUES (
	200, 201000, 'Half-dome Tent', 10, 250);
INSERT INTO INVENTORY VALUES (
	300, 201000, 'Half-dome Tent', 250, 0);
INSERT INTO INVENTORY VALUES (
	400, 201000, 'Half-dome Tent', 0, 250);
INSERT INTO INVENTORY VALUES (
	100, 202000, 'Half-dome Tent Vestibule', 10, 250);
INSERT INTO INVENTORY VALUES (
	200, 202000, 'Half-dome Tent Vestibule', 1, 250);
INSERT INTO INVENTORY VALUES (
	300, 202000, 'Half-dome Tent Vestibule', 100, 0);
INSERT INTO INVENTORY VALUES (
	400, 202000, 'Half-dome Tent Vestibule', 0, 200);
INSERT INTO INVENTORY VALUES (
	100, 301000, 'Light Fly Climbing Harness', 300, 250);
INSERT INTO INVENTORY VALUES (
	200, 301000, 'Light Fly Climbing Harness', 250, 250);
INSERT INTO INVENTORY VALUES (
	300, 301000, 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	400, 301000, 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	100, 302000, 'Locking Carabiner, Oval', 1000, 0);
INSERT INTO INVENTORY VALUES (
	200, 302000, 'Locking Carabiner, Oval', 1250, 0);
INSERT INTO INVENTORY VALUES (
	300, 302000, 'Locking Carabiner, Oval', 500, 500);
INSERT INTO INVENTORY VALUES (
	400, 302000, 'Locking Carabiner, Oval', 0, 1000);

-- CATALOG_SKU_2019 Data

INSERT INTO CATALOG_SKU_2019 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '01-JAN-19'),
	(100500, 'Std. Scuba Tank, Light Green', 'Water Sports', NULL, '01-JUL-19'),
	(100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', NULL, '01-JUL-19'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 24, '01-JAN-19'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 24, '01-JAN-19'),
	(201000, 'Half-dome Tent', 'Camping', 45, '01-JAN-19'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 47, '01-JAN-19'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '01-JAN-19'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '01-JAN-19');

-- CATALOG_SKU_2020 Data

INSERT INTO CATALOG_SKU_2020 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '01-JAN-20'),
	(100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 23, '01-JAN-20'),
	(100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', NULL, '01-AUG-20'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 26, '01-JAN-20'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 26, '01-JAN-20'),
	(201000, 'Half-dome Tent', 'Camping', 46, '01-JAN-20'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 46, '01-JAN-20'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 77, '01-JAN-20'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 79, '01-JAN-20');

-- CATALOG_SKU_2021 Data

INSERT INTO CATALOG_SKU_2021 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '01-JAN-21'),
	(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 23, '01-JAN-21'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 27, '01-JAN-21'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 27, '01-JAN-21'),
	(201000, 'Half-dome Tent', 'Camping', 45, '01-JAN-21'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 45, '01-JAN-21'),
	(203000, 'Half-dome Tent Vestibule - Wide', 'Camping', NULL, '01-APR-21'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '01-JAN-21'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '01-JAN-21');	

/********************************************************************************/