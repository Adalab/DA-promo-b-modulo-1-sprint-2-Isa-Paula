USE northwind; 

-- 1
SELECT customers.customer_id, customers.company_name, COUNT(orders.order_id)
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, customers.customer_id;   # Tamaño de los registros

-- 2
-- 1o quiero saber el número de objetos en pedidos por año
SELECT YEAR(orders.order_date) AS año, SUM(order_details.quantity), customers.company_name
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, YEAR(orders.order_date);	# Nos devolverá los valores de forma única. Por eso, cuando una operación nos está devolviendo de por si valores únicos, no hace falta llamarlos al group by




UNION 
SELECT company_name
FROM customers
WHERE customers.country = 'UK'
GROUP BY order_details.product_id, año, 

SELECT customers.company_name, order_details.product_id
FROM customers
INNER JOIN order_detials
ON 

SELECT count(order_id), DAY(order_date) As dia, MONTH(order_date) AS mes, YEAR(order_date) AS año
FROM orders
GROUP BY order_date;