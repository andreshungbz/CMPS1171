SELECT "SaleDate", CAST("SaleDate" AS DATE)
FROM "NashvilleHousing";

SELECT *
FROM "NashvilleHousing"
WHERE "PropertyAddress" IS NULL;

SELECT *
FROM "NashvilleHousing" AS a
JOIN "NashvilleHousing" AS b
ON a."ParcelID" = b."ParcelID"
AND a."UniqueID" != b."UniqueID";

SELECT a."ParcelID", a."PropertyAddress", b."ParcelID", b."PropertyAddress", COALESCE(a."PropertyAddress", b."PropertyAddress")
FROM "NashvilleHousing" a
JOIN "NashvilleHousing" b
ON a."ParcelID" = b."ParcelID"
AND a."UniqueID" != b."UniqueID"
WHERE a."PropertyAddress" IS NULL;

-- Check this
UPDATE "NashvilleHousing"
SET "PropertyAddress" = COALESCE(a."PropertyAddress", b."PropertyAddress")
FROM "NashvilleHousing" a
JOIN "NashvilleHousing" b
ON a."ParcelID" = b."ParcelID"
AND a."UniqueID" != b."UniqueID"
WHERE a."PropertyAddress" IS NULL;

SELECT "PropertyAddress"
FROM "NashvilleHousing";

SELECT SUBSTRING("PropertyAddress", 1, POSITION(',' IN "PropertyAddress")) AS address
FROM "NashvilleHousing";