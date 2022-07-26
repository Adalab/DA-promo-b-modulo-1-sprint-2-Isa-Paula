USE northwind;

-- 1. una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
-- Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto,
-- además de la relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra 
-- respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
-- Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship

SELECT city, company_name, contact_name, "cliente" AS Relationship
FROM customers
UNION
SELECT city, company_name, contact_name, "proveedor" AS Relationship
FROM suppliers;

-- 2. Extraer todos los pedidos gestinados por "Nancy Davolio"
-- En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", 
-- una de nuestras empleadas. Nos pide todos los detalles tramitados por ella.

SELECT *
FROM orders
WHERE employee_id IN (
SELECT employee_id
FROM employees
WHERE first_name = "Nancy");


-- 3. Extraed todas las empresas que no han comprado en el año 1997
-- En este caso, nuestro jefe quiere saber cuántas empresas no han comprado en el año 1997.

SELECT company_name, country
FROM customers
WHERE customer_id NOT IN(
SELECT customer_id
FROM orders
WHERE year(order_date)= 1997);

-- 4. Extraed toda la información de los pedidos donde tengamos "Konbu"
-- Estamos muy interesados en saber como ha sido la evolución de la venta de Konbu 
-- a lo largo del tiempo. Nuestro jefe nos pide que nos muestre todos los pedidos que contengan "Konbu".
💡-- Pista 💡 En esta query tendremos que combinar conocimientos adquiridos en las lecciones anteriores 
-- como por ejemplo el INNER JOIN.

SELECT*
FROM orders
INNER JOIN products
ON products.product_id;  -- pendienete de terminar la consulta


