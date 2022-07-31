-- 2-- 
USE northwind;
SELECT *
FROM orders
WHERE employee_id IN(
SELECT employee_id
FROM employees
WHERE first_name = 'Nancy');

-- 3--
SELECT company_name, country
FROM customers 
WHERE customer_id NOT IN (
SELECT customer_id
FROM orders
WHERE YEAR(order_date) = 1997);

-- 4--
		SELECT *
		FROM order_details
		WHERE order_id IN(
			SELECT order_details.order_id
			FROM order_details
			INNER JOIN products
			ON order_details.product_id = products.product_id
			WHERE products.product_name = 'Konbu');
			
SELECT *
FROM orders
WHERE order_id IN(
	SELECT order_details.order_id			# No nos deja tener más de una columna, ya que con el IN tiene que coincidir el valor del WHERE de arriba
	FROM order_details
	INNER JOIN products
	ON order_details.product_id = products.product_id
    WHERE products.product_name = 'Konbu'); # Con el where puedo filtrar por otros campos que no esten en el select
											# Mientras que con el having, te obliga a referirte a campos del select
    




