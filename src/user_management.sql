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
SELECT member_id, COUNT(*) AS registration_count
FROM class_attendance
GROUP BY member_id
ORDER BY registration_count DESC
LIMIT 1;
-- TODO: Write a query to find the member with the most class registrations

-- 5. Find member with the least class registrations
SELECT member_id, COUNT(*) AS registration_count
FROM class_attendance
GROUP BY member_id
HAVING registration_count > 0
ORDER BY registration_count ASC
LIMIT 1;
-- TODO: Write a query to find the member with the least class registrations

-- 6. Calculate the percentage of members who have attended at least one class
SELECT (COUNT(DISTINCT member_id) * 100.0 / (SELECT COUNT(*) FROM members)) AS percentage_attended
FROM class_attendance
WHERE attendance_status = 'Attended';
-- TODO: Write a query to calculate the percentage of members who have attended at least one class