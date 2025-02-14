-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Staff Management Queries

-- 1. List all staff members by role
SELECT staff_id, first_name, last_name, position AS role
FROM staff
ORDER BY position;
-- TODO: Write a query to list all staff members by role

-- 2. Find trainers with one or more personal training session in the next 30 days
-- TODO: Write a query to find trainers with one or more personal training session in the next 30 days