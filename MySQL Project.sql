-- TASK 1
CREATE DATABASE philipmudambo;
USE philipmudambo;
CREATE TABLE employees (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE departments (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE salaries (
  id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

-- TASK 2a
SELECT * FROM customers ORDER BY points DESC;

-- TASK 2b
SELECT first_name,last_name, points
FROM customers
ORDER BY points ASC
LIMIT 5;

-- TASK 2c
ALTER TABLE customers
CHANGE COLUMN phone phone_numbers VARCHAR(20),
CHANGE COLUMN points total_points INT;

-- TASK 2d
SELECT customer_id, first_name, last_name, birth_date 
FROM customers;

-- TASK 2e
SELECT *
FROM customers
WHERE phone IS NULL;
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- TASK 2f
ALTER TABLE customers ADD COLUMN new_points DECIMAL(10,2);
UPDATE customers SET new_points = total_points * 0.2;

-- TASK 2g
UPDATE customers
SET last_name = 'Benson'
WHERE customer_id = 4;

-- TASK 2h
SELECT DISTINCT city
FROM customers;

-- TASK 2i
SELECT SUM(total_points) AS total_points, AVG(total_points) AS average_points_per_customer
FROM customers;
SELECT SUM(total_points) AS total_points, AVG(total_points) AS average_points_per_city, city
FROM customers
GROUP BY city;

-- TASK 2j
SELECT * FROM customers WHERE birth_date <= '1980-01-01';

-- TASK 2k
SELECT COUNT(*) FROM customers WHERE birth_date = '1991-01-01';

-- TASK 3a
SELECT *
FROM clients
JOIN invoices
ON clients.client_id = invoices.client_id;

-- TASK 3b
SELECT name, address, city
FROM clients c
LEFT JOIN invoices i
ON c.client_id = i.client_id
UNION
SELECT name, address, city
FROM clients c
RIGHT JOIN invoices i
ON c.client_id = i.client_id;













