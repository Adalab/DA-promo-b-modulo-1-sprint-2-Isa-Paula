USE northwind; 

-- 1 Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos 
-- conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

SELECT customers.customer_id, customers.company_name, COUNT(orders.order_id)
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, customers.customer_id;   # Tamaño de los registros

-- 2 Desde Reino Unido nos han pedido una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de 
-- UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.
-- 1o quiero saber el número de objetos en pedidos por año

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS NumObjetos
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, YEAR(orders.order_date);	# Nos devolverá los valores de forma única. Por eso, cuando una operación nos está devolviendo de por si valores únicos, no hace falta llamarlos al group by

-- 3 Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido 
-- por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en 
-- sporcentajes, 15% nos sale como 0.15.

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS NumObjetos, SUM((order_details.unit_price * order_details.quantity)-order_details.discount) AS DineroTotal
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, YEAR(orders.order_date);

-- 4 BONUS: Pedidos que han realizado cada compañía y su fecha:
-- Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han
-- pedido una consulta que indique el nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.

SELECT company_name, order_id, order_date
FROM orders
INNER JOIN customers
ON customers.customer_id = orders.customer_id;

-- 5 BONUS: Tipos de producto vendidos:
-- Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre 
-- del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT products.product_name, SUM((order_details.unit_price*order_details.quantity)-(order_details.discount*(order_details.unit_price*order_details.quantity))) AS PrecioProducto, category_name, categories.category_id
FROM products
INNER JOIN order_details
ON products.product_id = order_details.product_id
INNER JOIN categories
ON categories.category_id = products.category_id
GROUP BY category_id, products.product_name;

