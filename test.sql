/* =====================================================
   File: sample_database.sql
   Description: Sample schema and data
   Author: Chetan Pande
   ===================================================== */

-- =========================================
-- 1. Create Database
-- =========================================
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- =========================================
-- 2. Create Tables
-- =========================================

-- Employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    department  VARCHAR(50),
    salary      DECIMAL(10,2) CHECK (salary >= 0),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Projects table
CREATE TABLE projects (
    project_id   INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date   DATE NOT NULL,
    end_date     DATE
);

-- Employee-Project mapping
CREATE TABLE employee_projects (
    employee_id INT NOT NULL,
    project_id  INT NOT NULL,
    assigned_on DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_emp
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_proj
        FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- =========================================
-- 3. Insert Sample Data
-- =========================================

INSERT INTO employees (first_name, last_name, email, department, salary)
VALUES
('John', 'Doe', 'john.doe@company.com', 'Engineering', 90000),
('Jane', 'Smith', 'jane.smith@company.com', 'QA', 75000),
('Alex', 'Brown', 'alex.brown@company.com', 'DevOps', 85000);

INSERT INTO projects (project_name, start_date, end_date)
VALUES
('Automated Code Review', '2024-01-15', NULL),
('UI Revamp', '2024-02-01', '2024-06-30');

INSERT INTO employee_projects (employee_id, project_id)
VALUES
(1, 1),
(2, 1),
(3, 2);

-- =========================================
-- 4. Sample Queries
-- =========================================

-- Get all employees
SELECT * FROM employees;

-- Get employees with their projects
SELECT
    e.first_name,
    e.last_name,
    p.project_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id;

-- Update salary
UPDATE employees
SET salary = salary + 5000
WHERE department = 'Engineering';

-- Delete an employee
DELETE FROM employees
WHERE email = 'john.doe@company.com';
