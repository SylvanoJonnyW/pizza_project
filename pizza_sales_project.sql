-- Total pizza orders
/*
SELECT 
    pizza_id,
    COUNT(quantity) AS orders
FROM order_details
GROUP BY pizza_id
ORDER BY orders DESC;
*/

-- Total orders by date in a day 
/*
SELECT 
	orders_date.date,
    COUNT(*) AS total_orders
FROM orders_date
GROUP BY date
ORDER BY date, total_orders DESC;
*/

-- Total quantity bought and Total sales by date 
/*
SELECT
	orders_date.date,
    COUNT(order_details.quantity) AS total_quantity_bought,
    ROUND(SUM(pizzas.price),0) AS total_sales
FROM order_details 
INNER JOIN orders_date 
	ON order_details.order_id = orders_date.order_id
INNER JOIN pizzas
	ON order_details.pizza_id = pizzas.pizza_id
GROUP BY orders_date.date
ORDER BY orders_date.date;
*/

-- Max pizza bought and min pizza bought by date 
/*
SELECT 
	orders_date.date,
    MAX(order_details.pizza_id) AS max_pizza,
    MIN(order_details.pizza_id) AS min_pizza
FROM order_details
INNER JOIN orders_date 
	ON order_details.order_id = orders_date.order_id
GROUP BY orders_date.date;
*/

-- Total Sales by Pizza
/*
SELECT 
	order_details.pizza_id,
    SUM(order_details.quantity) AS total_sold,
    ROUND(SUM(pizzas.price),0) AS total_sales
FROM order_details
INNER JOIN pizzas
	ON order_details.pizza_id = pizzas.pizza_id
GROUP BY order_details.pizza_id
ORDER BY total_sales DESC;
*/

-- Min Sales of Pizza (Create View Table) 
/*
CREATE VIEW pizza_sales AS
SELECT 
	order_details.pizza_id,
    SUM(order_details.quantity) AS total_sold,
    ROUND(SUM(pizzas.price),0) AS total_sales
FROM order_details
INNER JOIN pizzas
	ON order_details.pizza_id = pizzas.pizza_id
GROUP BY order_details.pizza_id;
*/

-- Min Sales of Pizza (344)
/*
SELECT	
	total_sales AS min_sales
FROM pizza_sales
WHERE total_sales = (SELECT MIN(total_sales) FROM pizza_sales);
*/

-- Max Sales of Pizza (9,088)
/*
SELECT
	total_sales AS max_sales
FROM pizza_sales
WHERE total_sales = (SELECT MAX(total_sales) FROM pizza_sales);
*/

-- price list of pizza
/*
SELECT 
	pizzas.pizza_id,
    pizzas.price AS price
FROM pizzas
ORDER BY price DESC;
*/

-- Top 10 Customers 
/*
SELECT 
	order_details.order_id,
    COUNT(order_details.quantity) AS total_transactions,
    SUM(pizzas.price) AS total_sales
FROM order_details
INNER JOIN pizzas
	ON order_details.pizza_id = pizzas.pizza_id
GROUP BY order_id
ORDER BY total_sales DESC
LIMIT 10;
*/


