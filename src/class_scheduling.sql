-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Class Scheduling Queries

-- 1. List all classes with their instructors
SELECT c.class_id, c.name AS class_name, s.first_name || ' ' || s.last_name AS instructor_name
FROM classes c
JOIN class_schedule cs ON c.class_id = cs.class_id
JOIN staff s ON cs.staff_id = s.staff_id;
-- TODO: Write a query to list all classes with their instructors

-- 2. Find available classes for a specific date
SELECT c.class_id, c.name, cs.start_time, cs.end_time, (c.capacity - COUNT(ca.member_id)) AS available_spots
FROM classes c
JOIN class_schedule cs ON c.class_id = cs.class_id
LEFT JOIN class_attendance ca ON cs.schedule_id = ca.schedule_id
WHERE cs.start_time LIKE '2025-02-01%'
GROUP BY cs.schedule_id
HAVING available_spots > 0;
-- TODO: Write a query to find available classes for a specific date

-- 3. Register a member for a class
INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
SELECT schedule_id, 11 AS member_id, 'Registered' AS attendance_status
FROM class_schedule
WHERE class_id = 3 AND start_time LIKE '2025-02-01%';
-- TODO: Write a query to register a member for a class

-- 4. Cancel a class registration
DELETE FROM class_attendance
WHERE member_id = 2 AND schedule_id = 7;
-- TODO: Write a query to cancel a class registration

-- 5. List top 3 most popular classes
SELECT c.class_id, c.name AS class_name, COUNT(ca.member_id) AS registration_count
FROM classes c
JOIN class_schedule cs ON c.class_id = cs.class_id
JOIN class_attendance ca ON cs.schedule_id = ca.schedule_id
GROUP BY c.class_id
ORDER BY registration_count DESC
LIMIT 3;
-- TODO: Write a query to list top 5 most popular classes

-- 6. Calculate average number of classes per member
SELECT ROUND(AVG(class_count), 1) AS avg_classes_per_member
FROM (
    SELECT member_id, COUNT(*) AS class_count
    FROM class_attendance
    GROUP BY member_id
) AS member_classes;
-- TODO: Write a query to calculate average number of classes per member