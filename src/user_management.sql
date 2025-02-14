-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- User Management Queries

-- 1. Retrieve all members
SELECT * FROM members;
-- TODO: Write a query to retrieve all members

-- 2. Update a member's contact information
UPDATE members
SET phone_number = '555-9876', email = 'emily.jones.updated@email.com'
WHERE member_id = 5;
SELECT * FROM members WHERE member_id = 5;
-- TODO: Write a query to update a member's contact information

-- 3. Count total number of members
SELECT COUNT(*) AS total_members FROM members;
-- TODO: Write a query to count the total number of members

-- 4. Find member with the most class registrations
-- TODO: Write a query to find the member with the most class registrations

-- 5. Find member with the least class registrations
-- TODO: Write a query to find the member with the least class registrations

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class