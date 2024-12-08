-- Task 1: Retrieve the customer_name, city, and order_date 
-- for each customer who placed an order in 2023 by joining the customers and orders tables

-- SELECT 
--     c.customer_name, 
--     c.city, 
--     o.order_date
-- FROM 
--     customers c
-- JOIN 
--     orders o 
-- ON 
--     c.customer_id = o.customer_id
-- WHERE 
--     EXTRACT(YEAR FROM o.order_date) = 2023;


-- Get a list of all products (with product_name, category, and total_price)
-- ordered by customers living in Mumbai, by joining the customers, orders, order_items,
-- and products tables.

	
-- SELECT p.product_name, p.category,ot.total_price
-- FROM 
--     products p 
-- JOIN 
--     order_items ot
-- 	ON p.product_id = ot.product_id
-- JOIN 
--     orders o 
--     ON ot.order_id = o.order_id
-- JOIN
--     customers c 
-- 	ON c.customer_id = o.customer_id
-- WHERE c.city = 'Mumbai';


-- Find all orders where customers paid using 'Credit Card' and display the customer_name, order_date,
-- and total_price by joining the customers, orders, and order_items tables.


-- SELECT o.payment_mode, C.customer_name, o.order_date, ot.total_price 
-- FROM
--     customers c
-- JOIN 
--     orders o 
--     ON c.customer_id = o.customer_id
-- JOIN 
--     order_items ot
-- 	ON ot.order_id = o.order_id
-- WHERE 
--     o.payment_mode= 'Credit Card'


-- Display the product_name, category, and the total_price for all products ordered in the first half of 2023 
-- (January - June) by joining the orders, order_items, and products tables.


-- SELECT product_name, category, total_price
-- FROM products p
-- JOIN
--     order_items ot
-- 	ON p.product_id= ot.product_id
-- JOIN
--     orders o
-- 	ON ot.order_id= o.order_id
-- WHERE
--      p.supply_date BETWEEN '2023-01-01' AND '2023-06-30';


-- SELECT customer_name, SUM(ot.quantity) AS total_quantity_ordered
-- FROM customers c
-- JOIN  
--      orders o
-- 	ON o.customer_id = c.customer_id
-- JOIN 
--     order_items ot
-- 	ON ot.order_id = o.order_id
-- GROUP BY 
--     c.customer_name 

     
    