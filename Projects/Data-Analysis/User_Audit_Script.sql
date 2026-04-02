-- TITLE: System User Access Audit Script
-- PURPOSE: This script demonstrates data integrity and security checks
-- AUTHOR: Sabrina Ndela, BSc. Information Systems

-- 1. Create a sample table for system users
CREATE TABLE SystemUsers (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Department VARCHAR(50),
    AccessLevel VARCHAR(20),
    LastLogin DATE,
    IsActive BOOLEAN
);

-- 2. Insert sample data reflecting typical ICT system records
INSERT INTO SystemUsers (UserID, FullName, Department, AccessLevel, LastLogin, IsActive)
VALUES 
(1, 'Admin User', 'ICT', 'SuperAdmin', '2024-05-10', TRUE),
(2, 'Data Clerk', 'Records', 'Editor', '2024-05-12', TRUE),
(3, 'Guest User', 'General', 'Viewer', '2023-12-01', FALSE);

-- 3. AUDIT QUERY: Find inactive users for security cleanup
-- This demonstrates knowledge of System Evaluation and Data Security
SELECT FullName, Department, LastLogin
FROM SystemUsers
WHERE IsActive = FALSE OR LastLogin < '2024-01-01';

-- 4. REPORT QUERY: Count active users per department for resource allocation
SELECT Department, COUNT(UserID) as ActiveUserCount
FROM SystemUsers
WHERE IsActive = TRUE
GROUP BY Department;
