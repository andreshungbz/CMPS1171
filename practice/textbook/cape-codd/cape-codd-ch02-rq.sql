-- Database Processing 16e Chapter 2 Cape Codd Review Questions

-- 2.16
-- sku_description is repeated twice in both sku_data and inventory tables.
-- It was included in inventory to make querying easier with a single table instad of two.

-- 2.17
-- SELECT sku, sku_description
-- FROM inventory;

-- 2.18
-- SELECT sku_description, sku
-- FROM inventory;

-- 2.19
-- SELECT warehouseid
-- FROM inventory;

-- 2.20
-- SELECT DISTINCT warehouseid
-- FROM inventory;

-- 2.21
-- SELECT warehouseid, sku, sku_description, quantityonhand, quantityonorder
-- FROM inventory;

-- 2.22
-- SELECT *
-- FROM inventory;

-- 2.23
-- SELECT *
-- FROM inventory
-- WHERE quantityonhand > 0;

-- 2.24
-- SELECT sku, sku_description
-- FROM inventory
-- WHERE quantityonhand = 0;

-- 2.25
-- SELECT sku, sku_description, warehouseid
-- FROM inventory
-- WHERE quantityonhand = 0
-- ORDER BY warehouseid;

-- 2.26
-- SELECT sku, sku_description, warehouseid
-- FROM inventory
-- WHERE quantityonhand > 0
-- ORDER BY warehouseid DESC, sku;

-- 2.27
-- SELECT sku, sku_description, warehouseid
-- FROM inventory
-- WHERE quantityonhand = 0
-- AND quantityonorder > 0
-- ORDER BY warehouseid DESC, sku;

-- 2.28
-- SELECT sku, sku_description, warehouseid
-- FROM inventory
-- WHERE quantityonhand = 0
-- OR quantityonorder = 0
-- ORDER BY warehouseid DESC, sku;

-- 2.29
-- SELECT sku, sku_description, warehouseid, quantityonhand
-- FROM inventory
-- WHERE quantityonhand > 1
-- AND quantityonhand < 10;

-- 2.30
-- SELECT sku, sku_description, warehouseid, quantityonhand
-- FROM inventory
-- WHERE quantityonhand BETWEEN 2 AND 9;

-- 2.31
-- SELECT DISTINCT sku, sku_description
-- FROM inventory
-- WHERE sku_description LIKE 'Half-dome%';

-- 2.32
-- SELECT DISTINCT sku, sku_description
-- FROM inventory
-- WHERE sku_description LIKE '%Climb%';

-- 2.33
-- SELECT DISTINCT sku, sku_description
-- FROM inventory
-- WHERE sku_description LIKE '__d%';

-- 2.34
-- SELECT
-- SUM(quantityonhand) AS sum_quantity_on_hand,
-- AVG(quantityonhand) AS avg_quantity_on_hand,
-- MIN(quantityonhand) AS min_quantity_on_hand,
-- MAX(quantityonhand) AS max_quantity_on_hand,
-- COUNT(quantityonhand) AS count_quantity_on_hand
-- FROM inventory;

-- 2.35
-- COUNT returns the number of rows (excluding NULL).
-- SUM returns the sum of the values.

-- 2.36
-- SELECT warehouseid, SUM(quantityonhand) AS total_items_on_hand
-- FROM inventory
-- GROUP BY warehouseid
-- ORDER BY total_items_on_hand DESC;

-- 2.37
-- SELECT warehouseid, SUM(quantityonhand) AS total_items_on_hand_lt3
-- FROM inventory
-- WHERE quantityonhand < 3
-- GROUP BY warehouseid
-- ORDER BY total_items_on_hand_lt3 DESC;

-- 2.38
-- SELECT warehouseid, SUM(quantityonhand) AS total_items_on_hand_lt3
-- FROM inventory
-- WHERE quantityonhand < 3
-- GROUP BY warehouseid
-- HAVING COUNT(*) < 2
-- ORDER BY total_items_on_hand_lt3 DESC;

-- 2.39
-- The WHERE clause was applied before the HAVING clause.
-- This ensures no ambiguity.

-- 2.40
-- SELECT I.sku, I.sku_description, W.warehouseid, W.warehousecity, W.warehousestate
-- FROM inventory AS I
-- JOIN warehouse AS W
-- USING (warehouseid)
-- WHERE W.warehousecity = 'Atlanta'
-- OR W.warehousecity = 'Bangor'
-- OR W.warehousecity = 'Chicago';

-- 2.41
-- SELECT I.sku, I.sku_description, W.warehouseid, W.warehousecity, W.warehousestate
-- FROM inventory AS I
-- JOIN warehouse AS W USING (warehouseid)
-- WHERE W.warehousecity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.42
-- SELECT sku, sku_description, W.warehouseid, warehousecity, warehousestate
-- FROM inventory AS I
-- JOIN warehouse AS W USING (warehouseid)
-- WHERE warehousecity != 'Atlanta'
-- AND warehousecity != 'Bangor'
-- AND warehousecity != 'Chicago';

-- 2.43
-- SELECT sku, sku_description, W.warehouseid, warehousecity, warehousestate
-- FROM inventory AS I
-- JOIN warehouse AS W USING (warehouseid)
-- WHERE warehousecity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44
-- SELECT sku_description || ' is located in ' || warehousecity AS item_location
-- FROM inventory
-- JOIN warehouse
-- ON inventory.warehouseid = warehouse.warehouseid;

-- 2.45
-- SELECT sku, sku_description, warehouseid
-- FROM inventory
-- WHERE warehouseid IN (
--     SELECT warehouseid
--     FROM warehouse
--     WHERE manager = 'Lucille Smith'
-- );

-- 2.46
-- SELECT sku, sku_description, warehouse.warehouseid
-- FROM inventory, warehouse
-- WHERE inventory.warehouseid = warehouse.warehouseid
-- AND manager = 'Lucille Smith';

-- 2.47
-- SELECT sku, sku_description, warehouse.warehouseid
-- FROM inventory
-- JOIN warehouse USING (warehouseid)
-- WHERE manager = 'Lucille Smith';

-- 2.48
-- SELECT warehouseid, AVG(quantityonhand)
-- FROM inventory
-- WHERE warehouseid IN (
--     SELECT warehouseid
--     FROM warehouse
--     WHERE manager = 'Lucille Smith'
-- )
-- GROUP BY warehouseid;

-- 2.49
-- SELECT inventory.warehouseid, AVG(quantityonhand)
-- FROM inventory, warehouse
-- WHERE inventory.warehouseid = warehouse.warehouseid
-- AND manager = 'Lucille Smith'
-- GROUP BY inventory.warehouseid;

-- 2.50
-- SELECT I.warehouseid, AVG(I.quantityonhand)
-- FROM inventory AS I
-- JOIN warehouse AS W USING (warehouseid)
-- WHERE W.manager = 'Lucille Smith'
-- GROUP BY I.warehouseid;

-- 2.51
-- SELECT W.warehouseid, W.warehousecity, W.warehousestate, W.manager, I.sku, I.sku_description, I.quantityonhand
-- FROM inventory AS I
-- JOIN warehouse AS W USING (warehouseid)
-- WHERE W.manager = 'Lucille Smith';

-- 2.52
-- SELECT warehouseid, SUM(quantityonorder) total_items_on_order, SUM(quantityonhand) total_items_on_hand
-- FROM inventory
-- GROUP BY warehouseid, quantityonorder;

-- 2.53
-- We cannot use a subquery because it is not necessary.

-- 2.54
-- In a subquery, you can only SELECT fields in the top-level query.
-- JOINs can be used to include those fields.

-- 2.55
-- SELECT *
-- FROM warehouse
-- LEFT JOIN inventory USING (warehouseid);

-- 2.56
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2019
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL
-- UNION
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2020
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL;

-- 2.57
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2019
-- WHERE catalogpage IS NOT NULL
-- UNION
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2020
-- WHERE catalogpage IS NOT NULL;

-- 2.58
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2019
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL
-- INTERSECT
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2020
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL;

-- 2.59
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2019
-- WHERE catalogpage IS NOT NULL
-- INTERSECT
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2020
-- WHERE catalogpage IS NOT NULL;

-- 2.60
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2019
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL
-- EXCEPT
-- SELECT sku, sku_description, department
-- FROM catalog_sku_2020
-- WHERE catalogpage IS NOT NULL
-- OR dateonwebsite IS NOT NULL;