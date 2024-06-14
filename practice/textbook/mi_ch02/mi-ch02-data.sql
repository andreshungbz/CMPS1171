/****************************************************************************/
/*																			*/
/*	Kroenke, Auer, and Vandenberg											*/
/*	Database Processing (16th Edition) Chapter 02							*/
/*																			*/
/*	Morgan Importing [MI_CH02] Database - Insert Data						*/
/*																			*/
/*	These are the MySQL 8.0 SQL code solutions								*/
/*	   									                                    */
/****************************************************************************/

USE mi_ch02;
 
/*****   ITEM Data   ********************************************************/

INSERT INTO ITEM (description, purchasedate, store, city, quantity, localcurrencyamount, exchangerate) VALUES(
		'QE Dining set', '2021-04-07', 
		 'Eastern Treasures', 'Manila', 2, 403405, 0.01774);
INSERT INTO ITEM (description, purchasedate, store, city, quantity, localcurrencyamount, exchangerate) VALUES(
		'Willow Serving Dishes', '2021-07-15', 
		 'Jade Antiques', 'Singapore', 75, 102, 0.5903);
INSERT INTO ITEM (description, purchasedate, store, city, quantity, localcurrencyamount, exchangerate) VALUES(
		'Large Bureau', '2021-07-17', 
		 'Eastern Sales', 'Singapore', 8, 2000, 0.5903);
INSERT INTO ITEM (description, purchasedate, store, city, quantity, localcurrencyamount, exchangerate) VALUES(
		'Brass Lamps', '2021-07-20', 
		 'Jade Antiques', 'Singapore', 40, 50, 0.5903);

/*****   SHIPMENT Data   ***************************************************/

INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'ABC Trans-Oceanic', 2017651, '2020-12-10', '2021-03-15', 15000.00);
INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'ABC Trans-Oceanic', 2018012, '2021-01-10', '2021-03-20', 12000.00);
INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'Worldwide', 49100300, '2021-05-05', '2021-06-17', 20000.00);
INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'International', 399400, '2021-06-02', '2021-07-17', 17500.00 );
INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'Worldwide', 84899440, '2021-07-10', '2021-07-28', 25000.00);
INSERT INTO SHIPMENT (shippername, shipperinvoicenumber, departuredate, arrivaldate, insuredvalue) VALUES(
		'International', 488955, '2021-08-05', '2021-09-11', 18000.00);

/*****   SHIPMENT_ITEM Data   **********************************************/

INSERT INTO SHIPMENT_ITEM VALUES(3, 1, 1, 15000);
INSERT INTO SHIPMENT_ITEM VALUES(4, 1, 4, 1200);
INSERT INTO SHIPMENT_ITEM VALUES(4, 2, 3, 9500);
INSERT INTO SHIPMENT_ITEM VALUES(4, 3, 2, 4500);

/****************************************************************************/