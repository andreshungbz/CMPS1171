/********************************************************************************/
/*																				*/
/*	Kroenke, Auer, and Vandenberg												*/
/*  Database Processing (16th Edition) Chapter 02								*/
/*																				*/
/*	Cape Codd Outdoor Sports SQL Queries for Chapter 02 SQL Examples			*/
/*																				*/
/*	These are the Microsoft SQL Server 2019 SQL code solutions					*/
/*																				*/
/********************************************************************************/


/* DBP-e16 Chapter02 SQL-Query-CH02-01 */

SELECT		SKU, SKU_Description, Department, Buyer
FROM		SKU_DATA;

/* DBP-e16 Chapter02 SQL-Query-CH02-02 */

SELECT		*
FROM		SKU_DATA;

/* DBP-e16 Chapter02 SQL-Query-CH02-03 */
SELECT		Department, Buyer
FROM		SKU_DATA;

/* DBP-e16 Chapter02 SQL-Query-CH02-04 */

SELECT		Buyer, Department 
FROM		SKU_DATA;
/* *** Using a DBMS *** */

/* DBP-e16 Chapter02 SQL-Query-CH02-05 */

SELECT		DISTINCT Buyer, Department 
FROM		SKU_DATA;

/* DBP-e14 Chapter02 SQL-Query-CH02-06 */

SELECT		TOP 5 Buyer, Department
FROM		SKU_DATA;

/* DBP-e14 Chapter02 SQL-Query-CH02-07 */

SELECT		TOP 75 PERCENT Buyer, Department
FROM		SKU_DATA;


/* DBP-e14 Chapter02 SQL-Query-CH02-08 */

SELECT		*
FROM		SKU_DATA
WHERE		Department = 'Water Sports';


/* DBP-e14 Chapter02 SQL-Query-CH02-09 */

SELECT		*
FROM		CATALOG_SKU_2014
WHERE		DateOnWebSite = '01-JAN-2014';


/* DBP-e14 Chapter02 SQL-Query-CH02-10 */

SELECT		*
FROM		SKU_DATA
WHERE		SKU > 200000;

/* DBP-e14 Chapter02 SQL-Query-CH02-11 */

SELECT		SKU_Description, Department
FROM		SKU_DATA
WHERE		Department = 'Climbing';

/* DBP-e14 Chapter02 SQL-Query-CH02-12 */

SELECT		SKU_Description, Buyer
FROM		SKU_DATA
WHERE		Department = 'Climbing';

/* SQL Enhancements for Querying a Single Table */
/* ORDER BY                                     */

/* DBP-e14 Chapter02 SQL-Query-CH02-13 */

SELECT		*
FROM		ORDER_ITEM
ORDER BY	OrderNumber;

/* DBP-e14 Chapter02 SQL-Query-CH02-14 */

SELECT		*
FROM		ORDER_ITEM
ORDER BY	OrderNumber, Price;

/* DBP-e14 Chapter02 SQL-Query-CH02-15 */

SELECT		*
FROM		ORDER_ITEM
ORDER BY	Price, OrderNumber;

/* DBP-e14 Chapter02 SQL-Query-CH02-16 */

SELECT		*
FROM		ORDER_ITEM
ORDER BY	Price DESC, OrderNumber ASC;

/* DBP-e14 Chapter02 SQL-Query-CH02-17 */

SELECT		*
FROM		ORDER_ITEM
ORDER BY	Price DESC, OrderNumber;

/* SQL WHERE Clause Options */
/* SQL Logical Operators    */

/* DBP-e14 Chapter02 SQL-Query-CH02-18 */

SELECT		*
FROM		SKU_DATA
WHERE		Department='Water Sports'
	AND		Buyer='Nancy Meyers';

/* DBP-e14 Chapter02 SQL-Query-CH02-19 */

SELECT		*
FROM		SKU_DATA
WHERE		Department='Camping'
	OR		Department='Climbing';

/* DBP-e14 Chapter02 SQL-Query-CH02-20 */

SELECT		*
FROM		SKU_DATA
WHERE		Department='Water Sports'
	AND	NOT	Buyer='Nancy Meyers';


/* DBP-e14 Chapter02 SQL-Query-CH02-21 */

SELECT		*
FROM		SKU_DATA
WHERE		Buyer IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

/* DBP-e14 Chapter02 SQL-Query-CH02-22 */

SELECT		*
FROM		SKU_DATA
WHERE		Buyer NOT IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

/* DBP-e14 Chapter02 SQL-Query-CH02-23 */
SELECT		*
FROM		ORDER_ITEM
WHERE		ExtendedPrice >=100
	AND		ExtendedPrice <=200
ORDER BY	ExtendedPrice;


/* DBP-e14 Chapter02 SQL-Query-CH02-24 */

SELECT		*
FROM		ORDER_ITEM
WHERE		ExtendedPrice BETWEEN 100 AND 200
ORDER BY	ExtendedPrice;


/* DBP-e14 Chapter02 SQL-Query-CH02-25 */

SELECT		*
FROM		ORDER_ITEM
WHERE		ExtendedPrice NOT BETWEEN 100 AND 200
ORDER BY	ExtendedPrice;

/* SQL LIKE and NOT LIKE with Wildcard Options */

/* DBP-e14 Chapter02 SQL-Query-CH02-26 */

SELECT		*
FROM		SKU_DATA
WHERE		Buyer LIKE 'Pete%';

/* DBP-e14 Chapter02 SQL-Query-CH02-27 */

SELECT		*
FROM		SKU_DATA
WHERE		SKU_Description LIKE '%Tent%';

/* DBP-e14 Chapter02 SQL-Query-CH02-28 */

SELECT		*
FROM		SKU_DATA
WHERE		SKU LIKE '%2%';

/* DBP-e14 Chapter02 SQL-Query-CH02-29 */

SELECT		*
FROM		SKU_DATA
WHERE		SKU LIKE '%2__';


/* DBP-e14 Chapter02 SQL-Query-CH02-30 */

SELECT		*
FROM		CATALOG_SKU_2015
WHERE		CatalogPage IS NULL;

/* DBP-e14 Chapter02 SQL-Query-CH02-31 */

SELECT		*
FROM		CATALOG_SKU_2015
WHERE		CatalogPage IS NOT NULL;

/* SQL Built-In Functions */

/* DBP-e14 Chapter02 SQL-Query-CH02-32 */

SELECT		SUM(OrderTotal)
FROM		RETAIL_ORDER;

/* DBP-e14 Chapter02 SQL-Query-CH02-33 */

SELECT		SUM(OrderTotal) AS OrderSum
FROM		RETAIL_ORDER;

/* DBP-e14 Chapter02 SQL-Query-CH02-34 */

SELECT		SUM(ExtendedPrice) AS Order3000Sum
FROM		ORDER_ITEM
WHERE		OrderNumber=3000;

/* DBP-e14 Chapter02 SQL-Query-CH02-35 */

SELECT		SUM(ExtendedPrice) AS OrderItemSum,
			AVG(ExtendedPrice) AS OrderItemAvg,
			MIN(ExtendedPrice) AS OrderItemMin,
			MAX(ExtendedPrice) AS OrderItemMax
FROM		ORDER_ITEM;

SELECT		*
FROM		INVENTORY;

SELECT		MIN(SKU_Description) AS SKUDescriptionMin,
			MAX(SKU_Description) AS SKUDescriptionMax
FROM		INVENTORY;


/* DBP-e14 Chapter02 SQL-Query-CH02-36 */

SELECT		COUNT(*) AS NumberOfRows
FROM		ORDER_ITEM;

/* DBP-e14 Chapter02 SQL-Query-CH02-37 */

SELECT		COUNT(Department) AS DeptCount
FROM		SKU_DATA;

/* DBP-e14 Chapter02 SQL-Query-CH02-38 */

SELECT		COUNT(DISTINCT Department) AS DeptCount
FROM		SKU_DATA;

/* DBP-e14 Chapter02 SQL-Query-CH02-39 */

SELECT		COUNT(CatalogPage) AS Catalog2015NumberOfSKU
FROM		CATALOG_SKU_2015;


/* DBP-e14 Chapter02 SQL-Query-CH02-40 */

SELECT		Department, COUNT(*)
FROM		SKU_DATA;

/* DBP-e14 Chapter02 SQL-Query-CH02-41 */

SELECT		*
FROM		RETAIL_ORDER
WHERE		OrderTotal > AVG(OrderTotal);

/* SQL Expressions in SQL SELECT Statements */

/* DBP-e14 Chapter02 SQL-Query-CH02-42 */

SELECT		OrderNumber, SKU, (Quantity * Price) AS EP
FROM		ORDER_ITEM
ORDER BY	OrderNumber, SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-43 */

SELECT		OrderNumber, SKU,
			(Quantity * Price) AS EP, ExtendedPrice
FROM		ORDER_ITEM
ORDER BY	OrderNumber, SKU;


/* DBP-e14 Chapter02 SQL-Query-CH02-44 */

SELECT		OrderNumber, SKU
FROM		ORDER_ITEM
WHERE		(Quantity * Price) <> ExtendedPrice
ORDER BY	OrderNumber, SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-44-TEST */

SELECT		OrderNumber, SKU
FROM		ORDER_ITEM
WHERE		(Quantity * Price) > AVG(ExtendedPrice)
ORDER BY	OrderNumber, SKU;


/* DBP-e14 Chapter02 SQL-Query-CH02-45 */

SELECT		SKU, SKU_Description,
			(Buyer+' in '+Department) AS Sponsor
FROM		SKU_DATA
ORDER BY	SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-46 */

SELECT		SKU, SKU_Description,
			RTRIM(Buyer)+' in '+RTRIM(Department) AS Sponsor
FROM		SKU_DATA
ORDER BY	SKU;

/* Grouping in SQL SELECT statements */

SELECT * FROM CATALOG_SKU_2014;

/* DBP-e14 Chapter02 SQL-Query-CH02-47 */

SELECT		Department, COUNT(SKU) AS NumberOfCatalogItems
FROM		CATALOG_SKU_2014
GROUP BY	Department;


/* DBP-e14 Chapter02 SQL-Query-CH02-48 */

SELECT		Department, COUNT(SKU) AS NumberOfCatalogItems
FROM		CATALOG_SKU_2014
WHERE		CatalogPage IS NOT NULL
GROUP BY	Department;

/* DBP-e14 Chapter02 SQL-Query-CH02-49 */

SELECT		Department, COUNT(SKU) AS NumberOfCatalogItems
FROM		CATALOG_SKU_2014
WHERE		CatalogPage IS NOT NULL
GROUP BY	Department
HAVING		COUNT(SKU) > 2;


/* DBP-e14 Chapter02 SQL-Query-CH02-50 */

SELECT		Department, Buyer, COUNT(SKU) AS Dept_Buyer_SKU_Count
FROM		SKU_DATA
GROUP BY	Department, Buyer;

/* DBP-e14 Chapter02 SQL-Query-CH02-51 */

SELECT		Department, SKU, COUNT(SKU) AS Dept_SKU_Count
FROM		SKU_DATA
GROUP BY	Department;

/* DBP-e14 Chapter02 SQL-Query-CH02-52 */

SELECT		Department, COUNT(SKU) AS Dept_SKU_Count
FROM		SKU_DATA
WHERE		SKU <> 302000
GROUP BY	Department
HAVING		COUNT (SKU) > 1
ORDER BY	Dept_SKU_Count;

/* Multiple Table Queries - Subqueries */

/* DBP-e14 Chapter02 SQL-Query-CH02-53 */

SELECT		SUM(ExtendedPrice) AS WaterSportsRevenue
FROM		ORDER_ITEM
WHERE		SKU IN (100100, 100200, 101100, 101200);

/* DBP-e14 Chapter02 SQL-Query-CH02-54 */

SELECT		SKU
FROM		SKU_DATA
WHERE		Department='Water Sports';

/* DBP-e14 Chapter02 SQL-Query-CH02-55 */

SELECT		SUM(ExtendedPrice) AS WaterSportsRevenue
FROM		ORDER_ITEM
WHERE		SKU IN
			(SELECT	SKU
			 FROM	SKU_DATA
			 WHERE	Department='Water Sports');

/* DBP-e14 Chapter02 SQL-Query-CH02-56 */

SELECT		DISTINCT Buyer, Department
FROM		SKU_DATA
WHERE		SKU IN
			(SELECT		SKU
			 FROM		ORDER_ITEM
			 WHERE		OrderNumber IN
				(SELECT		OrderNumber
				 FROM		RETAIL_ORDER
				 WHERE		OrderMonth='January'
					AND		OrderYear=2015));

/* DBP-e14 Chapter02 SQL-Query-CH02-57 */

SELECT		Buyer, Department, COUNT(SKU) AS Number_Of_SKU_Sold
FROM		SKU_DATA
WHERE		SKU IN
			(SELECT		SKU
			 FROM		ORDER_ITEM
			 WHERE		OrderNumber IN
				(SELECT		OrderNumber
				 FROM		RETAIL_ORDER
				 WHERE		OrderMonth='January'
					AND		OrderYear=2015))
GROUP BY	Buyer, Department
ORDER BY 	Number_Of_SKU_Sold;

/* Querying Multiple Tables with Joins */

/* DBP-e14 Chapter02 SQL-Query-CH02-58 */

SELECT		*
FROM		RETAIL_ORDER, ORDER_ITEM;

/* DBP-e14 Chapter02 SQL-Query-CH02-59 */

SELECT		*
FROM		RETAIL_ORDER, ORDER_ITEM
WHERE		RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber;

/* DBP-e14 Chapter02 SQL-Query-CH02-60 */

SELECT		*
FROM		RETAIL_ORDER, ORDER_ITEM
WHERE		RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
ORDER BY	RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-61 */

SELECT		Buyer, SKU_DATA.SKU, SKU_Description, OrderNumber, ExtendedPrice
FROM		SKU_DATA, ORDER_ITEM
WHERE		SKU_DATA.SKU=ORDER_ITEM.SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-62 */

SELECT		Buyer, SKU_DATA.SKU, SKU_Description,
			SUM(ExtendedPrice) AS BuyerSKURevenue
FROM		SKU_DATA, ORDER_ITEM
WHERE		SKU_DATA.SKU = ORDER_ITEM.SKU
GROUP BY	Buyer, SKU_DATA.SKU,SKU_Description
ORDER BY	BuyerSKURevenue DESC;

/* DBP-e14 Chapter02 SQL-Query-CH02-63 */
/* Produces an error message			*/

SELECT		Buyer, SKU_DATA.SKU, SKU_Description,
			SUM(ExtendedPrice) AS BuyerSKURevenue
FROM		SKU_DATA, ORDER_ITEM
WHERE		SKU_DATA.SKU = ORDER_ITEM.SKU
GROUP BY	Buyer, SKU_DATA.SKU
ORDER BY	BuyerSKURevenue DESC;


/* DBP-e14 Chapter02 SQL-Query-CH02-64 */

SELECT		Buyer, SKU_DATA.SKU, SKU_Description,
			RETAIL_ORDER.OrderNumber, OrderMonth, ExtendedPrice
FROM		SKU_DATA, ORDER_ITEM, RETAIL_ORDER
WHERE		SKU_DATA.SKU=ORDER_ITEM.SKU
		AND	ORDER_ITEM.OrderNumber=RETAIL_ORDER.OrderNumber;

/

/********************************************************************************/

/* JOIN ON SYNTAX                      */
/* DBP-e14 Chapter02 SQL-Query-CH02-65 */

SELECT		*
FROM		RETAIL_ORDER JOIN ORDER_ITEM
	ON		RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
ORDER BY	RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-66 */

SELECT			*
FROM			RETAIL_ORDER JOIN ORDER_ITEM
		ON		RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
WHERE			OrderYear = '2014'
ORDER BY		RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;


/* DBP-e14 Chapter02 SQL-Query-CH02-67 */

SELECT			RETAIL_ORDER.OrderNumber, StoreNumber, OrderYear,
				ORDER_ITEM.SKU, SKU_Description, Department
FROM			RETAIL_ORDER JOIN ORDER_ITEM
		ON		RETAIL_ORDER.OrderNumber = ORDER_ITEM.OrderNumber
				JOIN SKU_DATA
					ON ORDER_ITEM.SKU=SKU_DATA.SKU
WHERE			OrderYear = '2014'
ORDER BY		RETAIL_ORDER.OrderNumber, ORDER_ITEM.SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-68*/

SELECT			RO.OrderNumber, StoreNumber, OrderYear,
				OI.SKU, SKU_Description, Department
FROM			RETAIL_ORDER AS RO JOIN ORDER_ITEM AS OI
		ON		RO.OrderNumber = OI.OrderNumber
				JOIN SKU_DATA AS SD
					ON OI.SKU = SD.SKU
WHERE			OrderYear = '2014'
ORDER BY		RO.OrderNumber, OI.SKU;

/* DBP-e14 Chapter02 SQL-Query-CH02-69*/

SELECT			CatalogID, CS2014.SKU, CS2014.SKU_description,
				Buyer
FROM			CATALOG_SKU_2014 AS CS2014 JOIN SKU_DATA AS SD
		ON 		CS2014.SKU=SD.SKU
WHERE			CatalogPage IS NOT NULL
ORDER BY		CatalogID;





/********************************************************************************/

/* OUTER JOIN SYNTAX                   */


/* DBP-e14 Chapter02 SQL-Query-CH02-70*/

SELECT			OI.OrderNumber, Quantity,
				SD.SKU, SKU_Description, Department, Buyer
FROM			ORDER_ITEM AS OI JOIN SKU_DATA AS SD
		ON		OI.SKU=SD.SKU
ORDER BY		OI.OrderNumber, SD.SKU;


/* DBP-e14 Chapter02 SQL-Query-CH02-75*/

SELECT			OI.OrderNumber, Quantity,
				SD.SKU, SKU_Description, Department, Buyer
FROM			ORDER_ITEM AS OI RIGHT OUTER JOIN SKU_DATA AS SD
		ON		OI.SKU=SD.SKU
ORDER BY		OI.OrderNumber, SD.SKU;


/* DBP-e14 Chapter02 SQL-Query-CH02-76*/

SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2014
UNION
SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2015;

/* DBP-e14 Chapter02 SQL-Query-CH02-76-ALL*/

SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2014
UNION ALL
SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2015;

/* DBP-e14 Chapter02 SQL-Query-CH02-77*/

SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2014
INTERSECT
SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2015;

/* DBP-e14 Chapter02 SQL-Query-CH02-78*/

SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2014
EXCEPT
SELECT		SKU, SKU_Description, Department
FROM			CATALOG_SKU_2015;