DROP DATABASE IF EXISTS market;
CREATE DATABASE IF NOT EXISTS market;
USE market;
CREATE TABLE IF NOT EXISTS sales
(id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
order_data DATE,
count_product INT DEFAULT '0');
SELECT * FROM sales;

INSERT INTO sales (order_data, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

SELECT 
	id AS 'id заказа',
IF (count_product < 100, 'маленький заказ',
	IF (count_product >= 100 AND count_product < 300, 'средний заказ', 'большой заказ')) AS 'Тип заказа'
FROM sales;


DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
employee_id VARCHAR(15) NOT NULL,
amount FLOAT(5,2) NOT NULL,
order_status VARCHAR(20) NOT NULL);


INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT 
employee_id AS 'номер заказа',
amount AS 'стоимость',
CASE order_status 
	WHEN 'OPEN' THEN 'Order is in open state'
	WHEN 'CLOSED' THEN 'Order is closed'
	WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS 'full_order_status'	
FROM orders;

