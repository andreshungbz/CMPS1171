/********************************************************************************/
/*																				*/
/*	Kroenke, Auer, and Vandenberg												*/ 
/*  Database Processing (16th Edition) Chapter 02								*/
/*																				*/
/*	Marcia's Dry Cleaning [MDC_CH02] Database - Create Tables					*/
/*																				*/
/*	These are the MySQL 8.0 SQL code solutions									*/
/*																				*/
/********************************************************************************/

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS invoice_item;

CREATE TABLE CUSTOMER (
		CustomerID		Serial,
		FirstName 		Char(25)			NOT NULL,
		LastName		Char(25)			NOT NULL,
		Phone			Char(12)			NOT NULL,
		EmailAddress	Char(100)			NULL,
        ReferredBy		INT					NULL,
		CONSTRAINT		CustomerPK			PRIMARY KEY(CustomerID),
        CONSTRAINT		Cust_RefBy_FK 		FOREIGN KEY(ReferredBy)
							REFERENCES Customer(CustomerID)
			);
            

CREATE TABLE INVOICE (
		InvoiceNumber	Int 				DEFAULT nextval('invoice_seq'),
		CustomerID		Int					NOT NULL,
		DateIn			Date				NOT NULL,
		DateOut			Date				NULL,
		TotalAmount		Decimal(8,2)		NULL,
		CONSTRAINT		InvoicePK			PRIMARY KEY (InvoiceNumber),
		CONSTRAINT  	Invoice_Cust_FK 	FOREIGN KEY(CustomerID)
							REFERENCES CUSTOMER(CustomerID)
		);


CREATE TABLE INVOICE_ITEM (
		InvoiceNumber	Int					NOT NULL,
		ItemNumber		Int					NOT NULL,
		Item			Char(50)			NOT NULL,
		Quantity		Int					NOT NULL,
		UnitPrice		Decimal(8,2)		NULL,
		CONSTRAINT		InvoiceItemPK		PRIMARY KEY(InvoiceNumber, ItemNumber),
		CONSTRAINT		Item_Invoice_FK		FOREIGN KEY(InvoiceNumber)
							REFERENCES INVOICE(InvoiceNumber)
								ON DELETE CASCADE		
		);
