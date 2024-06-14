-- A
-- SELECT *
-- FROM item;

-- SELECT *
-- FROM shipment;

-- SELECT *
-- FROM shipment_item;

-- B
-- SELECT shipmentid, shippername, shipperinvoicenumber
-- FROM shipment;

-- C
-- SELECT shipmentid, shippername, shipperinvoicenumber
-- FROM shipment
-- WHERE insuredvalue > 10000.00;

-- D
-- SELECT shipmentid, shippername, shipperinvoicenumber
-- FROM shipment
-- WHERE shippername LIKE 'AB%';

-- E
-- SELECT shipmentid, shippername, shipperinvoicenumber, arrivaldate
-- FROM shipment
-- WHERE EXTRACT(MONTH FROM departuredate) = 12;

-- F
-- SELECT shipmentid, shippername, shipperinvoicenumber, arrivaldate
-- FROM shipment
-- WHERE EXTRACT(DAY FROM departuredate) = 10;

-- G
-- SELECT MAX(insuredvalue) max_insured_value, MIN(insuredvalue) min_insured_value
-- FROM shipment;

-- H
-- SELECT AVG(insuredvalue) avg_insured_value
-- FROM shipment;

-- I
-- SELECT COUNT(*) shipment_count
-- FROM shipment;

-- J
-- SELECT itemid, description, store, (localcurrencyamount * exchangerate) uscurrencyamount
-- FROM item;

-- K
-- SELECT city, store
-- FROM item
-- GROUP BY city, store;

-- L
-- SELECT city, store, COUNT(*)
-- FROM item
-- GROUP BY city, store;

-- M
-- SELECT shippername, shipmentid, departuredate
-- FROM shipment
-- WHERE shipmentid IN (
--     SELECT shipmentid
--     FROM shipment_item
--     WHERE value > 1000.00
--     )
-- ORDER BY shippername, departuredate DESC;

-- N*
-- SELECT S.shippername, S.shipmentid, S.departuredate
-- FROM shipment S
-- INNER JOIN shipment_item SI
-- ON S.shipmentid = SI.shipmentid
-- AND SI.value > 1000.00
-- ORDER BY shippername, departuredate DESC;

-- O
-- SELECT shippername, shipmentid, departuredate
-- FROM shipment
-- WHERE shipmentid IN (
--     SELECT shipmentid
--     FROM shipment_item
--     WHERE itemid IN (
--         SELECT itemid 
--         FROM item
--         WHERE city = 'Singapore'
--         )
--     )
-- ORDER BY shippername, departuredate DESC;

-- P*
-- SELECT S.shippername, S.shipmentid, S.departuredate
-- FROM shipment S, shipment_item SI, item I
-- WHERE S.shipmentid = SI.shipmentid
-- AND SI.itemid = I.itemid
-- AND I.city = 'Singapore'
-- ORDER BY shippername, departuredate DESC;

-- Q*
-- SELECT DISTINCT shippername, shipmentid, departuredate 
-- FROM shipment
-- INNER JOIN item 
-- ON item.itemid = shipment.shipmentid 
-- WHERE item.city = 'Singapore'
-- ORDER BY shippername, departuredate DESC;

-- R*
SELECT DISTINCT shippername, shipmentid, departuredate, value
FROM shipment
INNER JOIN item 
ON shipmentid IN (
    SELECT itemid 
    FROM item
    WHERE city = 'Singapore' 
    AND shipment.shipmentid = item.itemid
) 
ORDER BY shippername, departuredate DESC; 

-- SELECT DISTINCT ShipperName, ShipmentID, DepartureDate
-- FROM SHIPMENT 
-- INNER JOIN ITEM
-- ON ShipmentID IN (
--     SELECT ItemID 
--     FROM ITEM WHERE City = 'Singapore' 
--     AND SHIPMENT.ShipmentID = ITEM.ItemId
-- ) 
-- ORDER BY ShipperName asc, DepartureDate desc; 

-- S
