-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Membership Management Queries

-- 1. List all active memberships
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    ms.type AS membership_type, 
    ms.start_date, 
    ms.end_date, 
    ms.status
FROM 
    members m
JOIN 
    memberships ms ON m.member_id = ms.member_id
WHERE 
    ms.status = 'Active';
-- TODO: Write a query to list all active memberships

-- 2. Calculate the average duration of gym visits for each membership type
SELECT 
    ms.type AS membership_type, 
    ROUND(AVG((julianday(a.check_out_time) - julianday(a.check_in_time)) * 24 * 60)) AS avg_visit_duration_minutes
FROM 
    attendance a
JOIN 
    memberships ms ON a.member_id = ms.member_id
GROUP BY 
    ms.type;
-- TODO: Write a query to calculate the average duration of gym visits for each membership type

-- 3. Identify members with expiring memberships this year
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    m.email, 
    ms.end_date
FROM 
    memberships ms
JOIN 
    members m ON ms.member_id = m.member_id
WHERE 
    ms.end_date BETWEEN date('now') AND date('now', 'start of year', '+1 year', '-1 day');
-- TODO: Write a query to identify members with expiring memberships this year