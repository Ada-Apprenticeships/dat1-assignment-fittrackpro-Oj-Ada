-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Personal Training Queries

-- 1. List all personal training sessions for a specific trainer
SELECT 
    p.session_id,
    m.first_name || ' ' || m.last_name AS member_name,
    p.session_date,
    p.start_time,
    p.end_time
FROM 
    personal_training_sessions p
JOIN 
    staff s ON p.staff_id = s.staff_id
JOIN 
    members m ON p.member_id = m.member_id
WHERE 
    s.first_name || ' ' || s.last_name = 'Ivy Irwin';
-- TODO: Write a query to list all personal training sessions for a specific trainer
