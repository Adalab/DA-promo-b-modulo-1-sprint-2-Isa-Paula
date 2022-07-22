USE northwind;

-- 1.Qué empresas tenemos en la BBDD Northwind:
-- Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus 
-- pedidos y las fechas.

SELECT customers.company_name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- 2. Pedidos por cliente de UK:
-- Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada cliente del 
-- propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. Especificamente nos piden el nombre de cada 
-- compañía cliente junto con el número de pedidos.

SELECT customers.company_name, COUNT(orders.order_id)
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'			# QUE SEA DE UK (jenguaje humano)
GROUP BY customers.company_name;		# PARA CADA CLIENTE (lenguaje humano)

-- 3.Empresas de UK y sus pedidos:
-- También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) junto con los 
-- ID de todos los pedidos que han realizado, el nombre de contacto de cada empresa y la fecha del pedido.

SELECT customers.company_name, orders.order_id, customers.contact_name, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK';		# QUE SEA DE UK (jenguaje humano)
	# PARA CADA EMPRESA CLIENTE

-- 4. Empleadas que sean de la misma ciudad:
-- Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las
-- empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. 
-- Investiga el resultado, ¿sabes decir quién es el director?

SELECT employees1.city, employees1.first_name AS NombreEmpleado, employees1.last_name AS ApellidoEmpleado, employees2.city, employees2.first_name AS NombreJefe, employees2.last_name AS ApellidoJefe
FROM employees AS employees1, employees AS employees2
WHERE employees1.reports_to <> employees2.employee_id; # Aquellas empleadas que reporten a algo
		
SELECT employees1.city, employees1.first_name AS NombreEmpleado, employees1.last_name AS ApellidoEmpleado, employees2.city, employees2.first_name AS NombreJefe, employees2.last_name AS ApellidoJefe
FROM employees AS employees1, employees AS employees2
WHERE employees1.reports_to = employees2.employee_id;
