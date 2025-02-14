-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
INSERT INTO attendance (member_id, location_id, check_in_time, check_out_time)
VALUES (7, 1, datetime('now'), NULL);
-- TODO: Write a query to record a member's gym visit

-- 2. Retrieve a member's attendance history
SELECT check_in_time, check_out_time, location_id
FROM attendance
WHERE member_id = 5;
-- TODO: Write a query to retrieve a member's attendance history

-- 3. Find the busiest day of the week based on gym visits
SELECT 
    CASE strftime('%w', check_in_time)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    COUNT(*) AS visit_count
FROM 
    attendance
GROUP BY 
    day_of_week
ORDER BY 
    visit_count DESC
LIMIT 1;
-- TODO: Write a query to find the busiest day of the week based on gym visits

-- 4. Calculate the average daily attendance for each location
SELECT 
    l.name AS location_name, 
    ROUND(AVG(daily_visits), 1) AS avg_daily_attendance
FROM (
    SELECT 
        a.location_id, 
        date(a.check_in_time) AS visit_date, 
        COUNT(*) AS daily_visits
    FROM 
        attendance a
    GROUP BY 
        a.location_id, visit_date
) AS daily_counts
JOIN locations l ON daily_counts.location_id = l.location_id
GROUP BY 
    daily_counts.location_id;
-- TODO: Write a query to calculate the average daily attendance for each location