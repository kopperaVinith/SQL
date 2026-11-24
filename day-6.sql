USE cdg_hyd_jfs_060;

DROP TABLE employees;
DROP TABLE credentials;

CREATE TABLE credentials (
    credential_id INT PRIMARY KEY,
    username VARCHAR(10) UNIQUE,
    password VARCHAR(25)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT,
    cred_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(department_id),
    FOREIGN KEY (cred_id) REFERENCES credentials(credential_id) ON DELETE CASCADE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT,
    cred_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(department_id),
    FOREIGN KEY (cred_id) REFERENCES credentials(credential_id) ON UPDATE CASCADE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT,
    cred_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(department_id),
    FOREIGN KEY (cred_id) REFERENCES credentials(credential_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO credentials(credential_id, username, password) VALUES (301, 'nehgup', '12345');
INSERT INTO employees (employee_id, first_name, last_name, dept_id, cred_id) VALUES	(201, 'Neha', 'Gupta', 101, 301);

INSERT INTO credentials(credential_id, username, password) VALUES (302, 'bhasha', '12345');
INSERT INTO employees (employee_id, first_name, last_name, dept_id, cred_id) VALUES	(202, 'Bhavna', 'Sharma', 101, 302);

INSERT INTO credentials(credential_id, username, password) VALUES (303, 'gausha', '12345');
INSERT INTO employees (employee_id, first_name, last_name, dept_id, cred_id) VALUES	(203, 'Gaurav', 'Sharma', 102, 303);

SELECT employee_id, first_name, last_name, name FROM employees JOIN departments ON dept_id = department_id;

INSERT INTO credentials(credential_id, username, password) VALUES (304, 'ravjan', '12345');
INSERT INTO employees (employee_id, first_name, last_name, dept_id, cred_id) VALUES	(204, 'Ravi', 'Jangra', 102, 304);

INSERT INTO credentials(credential_id, username, password) VALUES (305, 'ashbak', '12345');
INSERT INTO employees (employee_id, first_name, last_name, cred_id) VALUES	(205, 'Ashish', 'Bakshi', 305);

INSERT INTO credentials(credential_id, username, password) VALUES (306, 'namjai', '12345');
INSERT INTO employees (employee_id, first_name, last_name, cred_id) VALUES	(206, 'Namrata', 'Jain', 306);

DELETE FROM employees WHERE employee_id = 206;

DELETE FROM employees WHERE employee_id = 206;
DELETE FROM credentials WHERE credential_id = 306;

DELETE FROM credentials WHERE credential_id = 306;

UPDATE credentials SET credential_id = 3001 WHERE credential_id = 301;
UPDATE credentials SET credential_id = 3002 WHERE credential_id = 302;
UPDATE credentials SET credential_id = 3003 WHERE credential_id = 303;
UPDATE credentials SET credential_id = 3004 WHERE credential_id = 304;
UPDATE credentials SET credential_id = 3005 WHERE credential_id = 305;
UPDATE credentials SET credential_id = 3006 WHERE credential_id = 306;

-- INNER JOIN
SELECT 
	employee_id, first_name, last_name, name
FROM departments
INNER JOIN employees
-- JOIN employees
ON department_id = dept_id;

-- RIGHT / RIGHT OUTER JOIN
SELECT 
	employee_id, first_name, last_name, name
FROM employees
RIGHT JOIN departments
-- RIGHT OUTER JOIN departments
ON dept_id = department_id;

-- LEFT / LEFT OUTER JOIN
SELECT 
	employee_id, first_name, last_name, name
FROM employees
LEFT JOIN departments
-- LEFT OUTER JOIN departments
ON dept_id = department_id;

-- FULL / OUTER JOIN
SELECT 
	employee_id, first_name, last_name, name 
FROM employees 
LEFT JOIN departments 
ON dept_id = department_id

UNION

SELECT 
	employee_id, first_name, last_name, name 
FROM employees 
RIGHT JOIN departments 
ON dept_id = department_id;