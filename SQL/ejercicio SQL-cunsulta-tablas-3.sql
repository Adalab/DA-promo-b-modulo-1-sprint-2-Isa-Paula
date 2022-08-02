USE northwind;

-- 1 Extraer toda la información sobre las compañias que tengamos en la BBDD
-- Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD.
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o
-- Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada 
-- como columna temporal. Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship

SELECT  'Hola!'  AS tipo_nombre
FROM customers; # Probando la tabla temporal del ejemplo

SELECT company_name, city, contact_name, 'Cliente' AS 'Relationship'
FROM customers
UNION
SELECT company_name, city, contact_name, 'Proveedor' AS 'Relationship'
FROM suppliers ;

-- 2 Extraer todos los pedidos gestinados por "Nancy Davolio" En este caso, nuestro jefe quiere saber cuantos pedidos ha 
-- gestionado "Nancy Davolio", una de nuestras empleadas. Nos pide todos los detalles tramitados por ella.-- 
SELECT *
FROM orders
WHERE employee_id IN(
SELECT employee_id
FROM employees
WHERE first_name = 'Nancy');

-- 3 Extraed todas las empresas que no han comprado en el año 1997 En este caso, nuestro jefe quiere saber cuántas empresas no 
-- han comprado en el año 1997.
SELECT company_name, country
FROM customers 
WHERE customer_id NOT IN (
SELECT customer_id
FROM orders
WHERE YEAR(order_date) = 1997);

-- 4 Extraed toda la información de los pedidos donde tengamos "Konbu" Estamos muy interesados en saber como ha sido la evolución
-- de la venta de Konbu a lo largo del tiempo. Nuestro jefe nos pide que nos muestre todos los pedidos que contengan "Konbu".

SELECT *
FROM orders
WHERE order_id IN(
	SELECT order_details.order_id			# No nos deja tener más de una columna, ya que con el IN tiene que coincidir el valor del WHERE de arriba
	FROM order_details
	INNER JOIN products
	ON order_details.product_id = products.product_id
    WHERE products.product_name = 'Konbu'); # Con el where puedo filtrar por otros campos que no esten en el select
											# Mientras que con el having, te obliga a referirte a campos del select
    




