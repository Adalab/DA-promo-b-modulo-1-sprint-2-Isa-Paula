USE northwind;

-- 1.  Relación entre número de pedidos y máxima carga:
-- Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre 
-- los mismos (freight) 
-- que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso). --

SELECT COUNT(order_id) , MAX(freight), employee_id
FROM orders
GROUP BY employee_id; 

-- 2. En el resultado anterior se han incluido muchos pedidos 
-- cuya fecha de envío estaba vacía, por lo que tenemos que mejorar la consulta en este aspecto. 
-- También nos piden que ordenemos los resultados según el ID de empleado para que la visualización sea más sencilla.

SELECT COUNT(order_id) , MAX(freight), employee_id
FROM orders
WHERE order_date IS NOT NULL
GROUP BY employee_id
ORDER BY employee_id;

-- 3.conocer mejor la distribución de los mismos según las fechas. Por lo tanto, 
-- tendremos que generar una consulta que nos saque el número de pedidos para cada día, 
-- mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).

SELECT count(order_id), DAY(order_date) As dia, MONTH(order_date) AS mes, YEAR(order_date) AS año
FROM orders
GROUP BY order_date;

-- 4. Número de pedidos por mes y año:
-- La consulta anterior nos muestra el número de pedidos para cada día concreto, 
-- pero esto es demasiado detalle. Genera una modificación de la consulta anterior para que agrupe 
-- los pedidos por cada mes concreto de cada año.
 
SELECT count(order_id), MONTH(order_date) AS mes, YEAR(order_date) AS año
FROM orders
GROUP BY mes, año;

-- 5. Seleccionad las ciudades con 4 o más empleadas:
-- Desde recursos humanos nos piden seleccionar los nombres de las ciudades con 4 o más empleadas 
-- de cara a estudiar la apertura de nuevas oficinas.

SELECT city, count(employee_id)
GROUP BY city 
FROM employees 
SELECT city, COUNT(employee_id) ;