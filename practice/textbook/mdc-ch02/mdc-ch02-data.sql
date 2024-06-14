/********************************************************************************/
/*																				*/
/*	Kroenke, Auer, and Vandenberg												*/ 
/*  Database Processing (16th Edition) Chapter 02								*/
/*																				*/
/*	Marcia's Dry Cleaning [MDC_CH02] Database - Insert Data						*/
/*																				*/
/*	These are the MySQL 8.0 SQL code solutions									*/
/*																				*/
/********************************************************************************/


/*****  CUSTOMER Data   *********************************************************/

INSERT INTO CUSTOMER VALUES(
	1, 'Nikki', 'Kaccaton', '723-543-1233', 'Nikki.Kaccaton@somewhere.com', NULL);
INSERT INTO CUSTOMER VALUES(
	2, 'Brenda', 'Catnazaro', '723-543-2344', 'Brenda.Catnazaro@somewhere.com', 1);
INSERT INTO CUSTOMER VALUES(
	3, 'Bruce', 'LeCat', '723-543-3455', 'Bruce.LeCat@somewhere.com', 2);
INSERT INTO CUSTOMER VALUES(
	4, 'Betsy', 'Miller', '725-654-3211', 'Betsy.Miller@somewhere.com', 3);
INSERT INTO CUSTOMER VALUES(
	5, 'George', 'Miller', '725-654-4322', 'George.Miller@somewhere.com', 4);
INSERT INTO CUSTOMER VALUES(
	6, 'Kathy', 'Miller', '723-514-9877', 'Kathy.Miller@somewhere.com', 2);
INSERT INTO CUSTOMER VALUES(
	7,  'Betsy', 'Miller', '723-514-8766', 'Betsy.Miller@elsewhere.com', 1);


/*****  INVOICE Data   **********************************************************/

INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		1, '2021-10-04', '2021-10-06', 158.50);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		2, '2021-10-04', '2021-10-06', 25.00);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		1, '2021-10-06', '2021-10-08', 49.00);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		4, '2021-10-06', '2021-10-08', 17.50);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		6, '2021-10-07', '2021-10-11', 12.00);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		3, '2021-10-11', '2021-10-13', 152.50);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		3, '2021-10-11', '2021-10-13', 7.00);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		7, '2021-10-12', '2021-10-14', 140.50);
INSERT INTO INVOICE (customerid, datein, dateout, totalamount) VALUES(
		5, '2021-10-12', '2021-10-14', 27.00);

/*****  INVOICE_ITEM Data   *****************************************************/

INSERT INTO INVOICE_ITEM VALUES(2021001, 1, 'Blouse', 2, 3.50);
INSERT INTO INVOICE_ITEM VALUES(2021001, 2, 'Dress Shirt', 5,  2.50);
INSERT INTO INVOICE_ITEM VALUES(2021001, 3, 'Formal Gown', 2, 10.00);
INSERT INTO INVOICE_ITEM VALUES(2021001, 4, 'Slacks-Mens', 10, 5.00);
INSERT INTO INVOICE_ITEM VALUES(2021001, 5, 'Slacks-Womens', 10, 6.00);
INSERT INTO INVOICE_ITEM VALUES(2021001, 6, 'Suit-Mens', 1,  9.00);
INSERT INTO INVOICE_ITEM VALUES(2021002, 1, 'Dress Shirt', 10, 2.50);
INSERT INTO INVOICE_ITEM VALUES(2021003, 1, 'Slacks-Mens', 5,  5.00);
INSERT INTO INVOICE_ITEM VALUES(2021003, 2, 'Slacks-Womens', 4, 6.00);
INSERT INTO INVOICE_ITEM VALUES(2021004, 1, 'Dress Shirt', 7,  2.50);
INSERT INTO INVOICE_ITEM VALUES(2021005, 1, 'Blouse', 2,  3.50);
INSERT INTO INVOICE_ITEM VALUES(2021005, 2, 'Dress Shirt', 2,  2.50);
INSERT INTO INVOICE_ITEM VALUES(2021006, 1, 'Blouse', 5,  3.50);
INSERT INTO INVOICE_ITEM VALUES(2021006, 2, 'Dress Shirt', 10, 2.50);
INSERT INTO INVOICE_ITEM VALUES(2021006, 3, 'Slacks-Mens', 10, 5.00);
INSERT INTO INVOICE_ITEM VALUES(2021006, 4, 'Slacks-Womens', 10, 6.00);
INSERT INTO INVOICE_ITEM VALUES(2021007, 1, 'Blouse', 2,  3.50);
INSERT INTO INVOICE_ITEM VALUES(2021008, 1, 'Blouse', 3,  3.50);
INSERT INTO INVOICE_ITEM VALUES(2021008, 2, 'Dress Shirt', 12, 2.50);
INSERT INTO INVOICE_ITEM VALUES(2021008, 3, 'Slacks-Mens', 8,  5.00);
INSERT INTO INVOICE_ITEM VALUES(2021008, 4, 'Slacks-Womens', 10, 6.00);
INSERT INTO INVOICE_ITEM VALUES(2021009, 1, 'Suit-Mens', 3,  9.00);

/********************************************************************************/