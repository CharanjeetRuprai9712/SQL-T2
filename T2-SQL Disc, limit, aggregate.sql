-- DISTINCT
-- Task 1: Get a distinct list of cities where customers are located.
-- Task 2: Retrieve distinct supplier_name from the products table.
-- Task 3: Find distinct payment methods used in the orders table.
-- Task 4: List all distinct product categories that have been ordered.
-- Task 5: Find distinct cities from which suppliers 
-- supply products by querying the products table.


-- SELECT DISTINCT city FROM customers ;
-- SELECT DISTINCT supplier_name FROM products;
-- SELECT DISTINCT payment_mode FROM orders;
-- SELECT DISTINCT category FROM products;
-- SELECT DISTINCT supplier_city FROM products;


-- ORDER BY
-- Task 1: List all customers sorted by customer_name in ascending order.
-- Task 2: Display all orders sorted by total_price in descending order.
-- Task 3: Retrieve a list of products sorted by price in ascending order and then by category in descending order.
-- Task 4: Sort all orders by order_date in descending order and display the order_id, customer_id, and order_date.
-- Task 5: Get the list of cities where orders were placed, sorted in alphabetical order, and display the total number of orders placed in each city.

-- Select * from customers ORDER BY customer_name 
-- SELECT * FROM order_items ORDER BY total_price desc;
-- SELECT * FROM products ORDER BY price asc, category desc;
-- SELECT order_id, customer_id, order_date 
-- FROM ORDERS 
-- ORDER BY order_date des
-- select city, count(order_id) from customers c
-- join orders o on c.customer_id=o.customer_id 
-- group by city order by city asc;

-- LIMIT & OFFSET
-- Task 1: Retrieve the first 10 rows from the customers table ordered by customer_name.
-- Task 2: Display the top 5 most expensive products (sorted by price in descending order).
-- Task 3: Get the orders for the 11th to 20th customers (using OFFSET and LIMIT), sorted by customer_id.
-- Task 4: List the first 5 orders placed in 2023, displaying order_id, order_date, and customer_id.
-- Task 5: Fetch the next 10 distinct cities where orders were placed, using LIMIT and OFFSET.

-- SELECT * FROM customers order by customer_name limit 10;
-- select * from products order by price limit 5;
-- select * from customers order by customer_id limit 10 offset 10;
-- select order_id, order_date, customer_id from orders where extract (year from order_date)=2023 order by order_date limit 5;;
-- select distinct delivery_city from orders limit 10 offset 10;


-- 5. AGGREGATE FUNCTIONS
-- Task 1: Calculate the total number of orders placed by all customers.
-- Task 2: Find the total revenue generated from orders paid via 'UPI' from the orders table.
-- Task 3: Get the average price of all products in the products table.
-- Task 4: Find the maximum and minimum total price of orders placed in 2023.
-- Task 5: Calculate the total quantity of products ordered for each product_id using the order_items table.

-- SELECT COUNT(customer_id) AS total_orders
-- FROM customers;
-- SELECT SUM(order_amount) from orders where payment_mode='UPI';
-- select AVG(price) from products;
-- select max(total_price), min(total_price) from order_items ot 
-- join orders o on ot.order_id = o.order_id where extract (year from order_date)=2023

-- select product_id, sum(quantity) as total_quantity from order_items 
-- group by product_id;


-- 6. SET OPERATIONS
-- Task 1: Get the list of customers who have placed orders in both 2022 and 2023 (use INTERSECT).
-- Task 2: Find the products that were ordered in 2022 but not in 2023 (use EXCEPT).
-- Task 3: Display the list of supplier_city from the products table that do not match any customer_city in the customers table (use EXCEPT).
-- Task 4: Show a combined list of supplier_city from products and city from customers (use UNION).
-- Task 5: Find the list of product_name from the products table that were

-- select customer_name from customers where customer_id in (select customer_id from orders where extract (year from order_date) = 2022
-- intersect
-- select customer_id from orders where extract (year from order_date) = 2023)

-- select product_name from products where product_id in (select product_id from orders o
-- join order_items ot 
-- on o.order_id = ot.order_id 
-- where extract (year from order_date) = 2022
-- except 
-- select product_id from orders o
-- join order_items ot 
-- on o.order_id = ot.order_id 
-- where extract (year from order_date) = 2023)

-- select supplier_city from products 
-- except
-- select city from customers

-- select supplier_city from products 
-- union
-- select city from customers

-- select product_name from products where product_id in  (select product_id from products 
-- intersect
-- select product_id from order_items ot join orders o 
-- on o.order_id=ot.order_id
-- where extract (year from order_date)=2023)



SubQuery:

-- select customer_name from customers where customer_id in (
-- select o.customer_id from orders o join order_items ot 
-- on ot.order_id= o.order_id 
-- where ot.total_price > (select avg(total_price) from order_items))


-- select customer_name from customers where customer_id in(
-- select o.customer_id from orders o join order_items ot 
-- on ot.order_id= o.order_id 
-- group by customer_id having sum(total_price)> (select avg(total_price) from order_items))

-- select product_name from products where product_id in(
-- select product_id from order_items group by product_id having count(*)>1
-- )


-- select product_name from products where product_id in 
-- ( select product_id from order_items ot join orders o on ot.order_id = o.order_id
-- join customers c on o.customer_id = c.customer_id where c.city = 'Pune'
-- );

-- select order_id, delivery_city, payment_mode from orders where order_id in (
-- select order_id from order_items group by order_id order by sum(total_price) desc limit 
-- )

-- select customer_name from customers where customer_id in (
--       select customer_id from orders o join order_items ot on o.order_id = ot.order_id 
--       join products p on ot.product_id = p.product_id where p.price > 30000)
-- )





