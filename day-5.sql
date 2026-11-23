USE cdg_hyd_jfs_060;

DROP TABLE employees;
DROP TABLE departments;

-- CHILD TABLE
CREATE TABLE employees (
    employee_id INT UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_assigned INT,
    FOREIGN KEY(department_assigned) REFERENCES departments (department_id)
);

-- PARENT TABLE
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO 
	departments(department_id, name)
VALUES
	(201, 'HR'),
    (202, 'Admin'),
    (203, 'IT'),
    (204, 'Finance'),
    (205, 'Development'),
    (206, 'Transport'),
    (207, 'Security');

SELECT * FROM departments;

INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(101, 'Neha', 'Gupta', 201);
    
DELETE FROM employees WHERE employee_id=101;
    
INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(101, 'Neha', 'Gupta', 201),
    (102, 'Varsha', 'Gupta', 201),
    (103, 'Bharat', 'Sharma', 202),
    (104, 'Gaurav', 'Kumar', '202'),
    (105, 'Akshat', 'Kumar', 203),
    (106, 'Gaurav', 'Kapoor', 203),
    (107, 'Jeevan', 'Sharma', 204),
    (108, 'Anand', 'Kumar', 204),
    (109, 'Ravi', 'Kumar', 205),
    (110, 'Ashish', 'Bakshi', 205);
    
SELECT * FROM employees;
    
-- RETRIEVE LIST OF EMPLOYEES ALONG DEPARTMENT THEY ARE ASSOCIATED WITH
SELECT 
	employee_id, first_name, last_name, name
FROM
	employees
JOIN
	departments
ON
	department_assigned = department_id;
  
-- RETRIEVE LIST OF DEAPRTMENTS ALONG WITH EMPLOYEES ASSIGNED TO IT
SELECT 
	employee_id, first_name, last_name, name
FROM
	departments
JOIN
	employees
ON
	department_id = department_assigned;



INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(101, 'Neha', 'Gupta', 'HR'),
    (102, 'Varsha', 'Gupta', 'HR'),
    (103, 'Bharat', 'Sharma', 'Admin'),
    (104, 'Gaurav', 'Kumar', 'Admin'),
    (105, 'Akshat', 'Kumar', 'IT'),
    (106, 'Gaurav', 'Kapoor', 'IT'),
    (107, 'Jeevan', 'Sharma', 'Finance'),
    (108, 'Anand', 'Kumar', 'Finance'),
    (109, 'Ravi', 'Kumar', 'Development'),
    (110, 'Ashish', 'Bakshi', 'Development');
    
INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(111, 'Namrata', 'Jain', 'Human Resources');
    
INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(112, NULL, NULL, 'Transport'),
    (113, NULL, NULL, 'Security');
    
INSERT INTO 
	employees(employee_id, first_name, last_name, department_assigned)
VALUES
	(114, 'Anil', 'Sharma', 'Transport'),
    (115, 'Manish', 'Malhotra', 'Security');
    
SELECT 
	employee_id, first_name, last_name, department_assigned
FROM
	employees;