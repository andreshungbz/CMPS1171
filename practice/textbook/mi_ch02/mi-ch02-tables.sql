/****************************************************************************/
/*																			*/
/*	Kroenke, Auer, and Vandenberg											*/
/*	Database Processing (16th Edition) Chapter 02							*/
/*																			*/
/*	Morgan Importing [MI_CH02] Database - Create Tables						*/
/*																			*/
/*	These are the MySQL 8.0 SQL code solutions								*/
/*	   									                                    */
/****************************************************************************/
/*																			*/
/*	NOTE:  These SQL Statements use the following surrogate keys:			*/
/*																			*/
/*		ITEM:		Start at 1, Increment by 1 - AUTO_INCREMENT (1, 1)		*/
/*		SHIPMENT:	Start at 1, Increment by 1 - AUTO_INCREMENT (1, 1)		*/
/*																			*/
/****************************************************************************/



CREATE TABLE ITEM (
		ItemID	            	SERIAL,
		Description		    	VarChar(255)		NOT NULL,
		PurchaseDate			Date				NOT NULL,
		Store			    	Char(50)			NOT NULL,
		City					Char(35)			NOT NULL,
		Quantity				Int		    		NOT NULL,
		LocalCurrencyAmount		Decimal(18,2)		NOT NULL,
		ExchangeRate	    	Decimal(12,6)		NOT NULL,
		CONSTRAINT				Item_PK	   	 		PRIMARY KEY (ItemID)
		);
        

CREATE TABLE SHIPMENT (
		ShipmentID			    SERIAL,
		ShipperName		    	Char(35)		    NOT NULL,
		ShipperInvoiceNumber	Int				    NOT NULL,
		DepartureDate		    Date			    NULL,
		ArrivalDate				Date			    NULL,
		InsuredValue		    Decimal(12,2)		NULL,
		CONSTRAINT				Shipment_PK	  		PRIMARY KEY (ShipmentID)
		);

 
CREATE TABLE SHIPMENT_ITEM (
		ShipmentID		   		Int				    NOT NULL,
		ShipmentItemID			Int				    NOT NULL,
		ItemID		    		Int				    NOT NULL,
		Value		  	    	Decimal(12,2)		NOT NULL,
		CONSTRAINT				ShipmentItem_PK	    PRIMARY KEY(ShipmentID, ShipmentItemID),
		CONSTRAINT				Ship_Item_Ship_FK	FOREIGN KEY(ShipmentID)
									REFERENCES SHIPMENT(ShipmentID)
										ON DELETE CASCADE,
		CONSTRAINT				Ship_Item_Item_FK	FOREIGN KEY(ItemID)
									REFERENCES ITEM(ItemID)
										ON DELETE CASCADE
     	);
        
/****************************************************************************/
