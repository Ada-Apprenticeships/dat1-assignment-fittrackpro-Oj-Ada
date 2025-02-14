-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Equipment Management Queries

-- 1. Find equipment due for maintenance
SELECT equipment_id, name, next_maintenance_date
FROM equipment
WHERE next_maintenance_date <= date('now', '+30 days');
-- TODO: Write a query to find equipment due for maintenance

-- 2. Count equipment types in stock
SELECT type, COUNT(*) AS count
FROM equipment
GROUP BY type;
-- TODO: Write a query to count equipment types in stock

-- 3. Calculate average age of equipment by type (in days)
-- TODO: Write a query to calculate average age of equipment by type (in days)