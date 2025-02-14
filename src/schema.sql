-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.db
.mode column

-- Enable foreign key support

-- Create your tables here
-- Example:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

-- TODO: Create the following tables:
-- 1. locations
CREATE TABLE IF NOT EXISTS locations (
    location_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone_number TEXT,
    email TEXT,
    opening_hours TEXT
);
-- 2. members
CREATE TABLE IF NOT EXISTS members (
    member_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT,
    date_of_birth DATE,
    join_date DATE NOT NULL,
    emergency_contact_name TEXT,
    emergency_contact_phone TEXT
);
-- 3. staff
CREATE TABLE IF NOT EXISTS staff (
    staff_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT,
    position TEXT CHECK(position IN ('Trainer', 'Manager', 'Receptionist')),
    hire_date DATE NOT NULL,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
-- 4. equipment
CREATE TABLE IF NOT EXISTS equipment (
    equipment_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT CHECK(type IN ('Cardio', 'Strength')),
    purchase_date DATE NOT NULL,
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
-- 5. classes
CREATE TABLE IF NOT EXISTS classes (
    class_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    capacity INTEGER NOT NULL,
    duration INTEGER NOT NULL,  -- Assuming duration is in minutes
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
-- 6. class_schedule
CREATE TABLE IF NOT EXISTS class_schedule (
    schedule_id INTEGER PRIMARY KEY,
    class_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
-- 7. memberships
CREATE TABLE IF NOT EXISTS memberships (
    membership_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('Basic', 'Premium')),
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
-- 8. attendance
CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    check_in_time DATETIME NOT NULL,
    check_out_time DATETIME,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
-- 9. class_attendance
CREATE TABLE class_attendance (
    class_attendance_id INTEGER PRIMARY KEY,
    schedule_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    attendance_status TEXT CHECK(attendance_status IN ('Registered', 'Attended', 'Unattended')),
    FOREIGN KEY (schedule_id) REFERENCES class_schedule(schedule_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
-- 10. payments
-- 11. personal_training_sessions
-- 12. member_health_metrics
-- 13. equipment_maintenance_log

-- After creating the tables, you can import the sample data using:
-- `.read data/sample_data.sql` in a sql file or `npm run import` in the terminal