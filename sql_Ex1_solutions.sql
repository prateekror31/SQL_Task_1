
# a) Create a database - practice
create database practice;

# b) Use the above created database
use practice;

# c) Create the table orders inside the practice database
# d) Insert the records in the orders table based on the given query below.

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cname VARCHAR(50),   # customer_name
    pname VARCHAR(50),   # product_name
    category VARCHAR(30),
    qty INT,             # quantity
    price_per_unit DECIMAL(10,2),
    order_date DATE,
    delivery_status VARCHAR(20)
);

INSERT INTO orders VALUES 
(1, 'Alice', 'Laptop', 'Electronics', 2, 55000.00, '2025-08-01', 'Delivered'),
(2, 'Bob', 'Smartphone', 'Electronics', 1, 23000.00, '2025-08-02', 'Pending'),
(3, 'Charlie', 'Tablet', 'Electronics', 3, 15000.00, '2025-08-02', 'Shipped'),
(4, 'David', 'Desk', 'Furniture', 1, 9000.00, '2025-08-03', 'Delivered'),
(5, 'Eve', 'Chair', 'Furniture', 4, 2500.00, '2025-08-04', 'Delivered'),
(6, 'Frank', 'Monitor', 'Electronics', 2, 12000.00, '2025-08-04', 'Cancelled'),
(7, 'Grace', 'Mouse', 'Accessories', 5, 500.00, '2025-08-05', 'Delivered'),
(8, 'Heidi', 'Keyboard', 'Accessories', 3, 1000.00, '2025-08-06', 'Pending'),
(9, 'Ivan', 'Chair', 'Furniture', 2, 2700.00, '2025-08-06', 'Shipped'),
(10, 'Judy', 'Laptop', 'Electronics', 1, 60000.00, '2025-08-07', 'Pending'),
(11, 'Kyle', 'Smartwatch', 'Electronics', 2, 8000.00, '2025-08-07', 'Delivered'),
(12, 'Laura', 'Bookshelf', 'Furniture', 1, 7000.00, '2025-08-08', 'Delivered'),
(13, 'Mallory', 'Tablet', 'Electronics', 2, 17000.00, '2025-08-08', 'Pending'),
(14, 'Nathan', 'Router', 'Accessories', 1, 3000.00, '2025-08-08', 'Shipped'),
(15, 'Olivia', 'Laptop', 'Electronics', 1, 58000.00, '2025-08-09', 'Delivered'),
(16, 'Peggy', 'Monitor', 'Electronics', 2, 12500.00, '2025-08-09', 'Pending'),
(17, 'Quentin', 'Mouse', 'Accessories', 6, 600.00, '2025-08-09', 'Delivered'),
(18, 'Rita', 'Desk', 'Furniture', 1, 8500.00, '2025-08-10', 'Cancelled'),
(19, 'Sam', 'Tablet', 'Electronics', 1, 16000.00, '2025-08-10', 'Shipped'),
(20, 'Trudy', 'Chair', 'Furniture', 3, 2800.00, '2025-08-11', 'Delivered'),
(21, 'Uma', 'Smartphone', 'Electronics', 2, 24000.00, '2025-08-11', 'Pending'),
(22, 'Victor', 'Router', 'Accessories', 1, 3100.00, '2025-08-12', 'Delivered'),
(23, 'Walter', 'Monitor', 'Electronics', 1, 11500.00, '2025-08-12', 'Pending'),
(24, 'Xander', 'Mouse', 'Accessories', 2, 550.00, '2025-08-13', 'Delivered'),
(25, 'Yolanda', 'Laptop', 'Electronics', 1, 62000.00, '2025-08-13', 'Delivered'),
(26, 'Zane', 'Bookshelf', 'Furniture', 2, 7200.00, '2025-08-14', 'Shipped'),
(27, 'Amy', 'Keyboard', 'Accessories', 4, 1050.00, '2025-08-14', 'Pending'),
(28, 'Brian', 'Desk', 'Furniture', 1, 8900.00, '2025-08-15', 'Delivered'),
(29, 'Clara', 'Smartphone', 'Electronics', 3, 22500.00, '2025-08-15', 'Shipped'),
(30, 'Dan', 'Smartwatch', 'Electronics', 1, 8500.00, '2025-08-15', 'Cancelled');


select * from orders;


-- Q1. What is the total quantity of products ordered?
SELECT SUM(qty) AS total_quantity FROM orders;


-- Q2. What is the average price per unit of all products?
SELECT AVG(price_per_unit) AS avg_price FROM orders;

-- Q3. What is the highest price per unit among all orders?
SELECT MAX(price_per_unit) AS max_price FROM orders;

-- Q4. How many distinct product names are there in orders table?
SELECT COUNT(DISTINCT pname) AS distinct_products FROM orders;

-- Q5. What is the total revenue (qty * price_per_unit) from delivered orders only?
SELECT SUM(qty * price_per_unit) AS revenue FROM orders 
WHERE delivery_status = 'Delivered';

-- Q6. Extract all orders with quantity >= 3 and price_per_unit < 20000.
SELECT * FROM orders WHERE qty >= 3 AND price_per_unit < 20000;

-- Q7. Show orders made between '2025-08-05' and '2025-08-10'.
SELECT * FROM orders WHERE order_date BETWEEN '2025-08-05' AND '2025-08-10';

-- Q8. Show all orders where category is not in ('Furniture', 'Accessories').
SELECT * FROM orders WHERE category NOT IN ('Furniture', 'Accessories');

-- Q9. Find orders where customer name starts with 'A'.
SELECT * FROM orders WHERE cname LIKE 'A%';


-- Q10. Find orders where product_name ends with 'top'.
SELECT * FROM orders WHERE pname LIKE '%top';


-- Q11. Find all orders where delivery_status is either 'Pending' or 'Cancelled'.
SELECT * FROM orders WHERE delivery_status IN ('Pending', 'Cancelled');


-- Q12. Find all order details where quantity is not 1 and price_per_unit is greater than 10000.
SELECT * FROM orders WHERE qty != 1 AND price_per_unit > 10000;

-- Q13. List all customers whose name contains exactly 5 characters.
SELECT * FROM orders WHERE name LIKE '_____';

-- Q14. Display all orders with either product_name = 'Laptop' or quantity = 6.
SELECT * FROM orders WHERE pname = 'Laptop' OR qty = 6;

-- Q15. Display all orders with price_per_unit between 1000 and 9000.
SELECT * FROM orders WHERE price_per_unit BETWEEN 1000 AND 9000;

-- Q16. Add a new column payment_mode. Set its default value as 'UPI'.
ALTER TABLE orders ADD payment_mode VARCHAR(20) default 'UPI';


-- Q17. Update payment_mode as 'Net Banking' for all delivered orders.
UPDATE orders SET payment_mode = 'UPI' WHERE delivery_status = 'Delivered';


-- Q18. Delete orders where quantity = 0 or price_per_unit = 0 (if such data exists)
DELETE FROM orders WHERE qty = 0 OR price_per_unit = 0;


-- Q19. Add a new column coupon_code to store applied coupons (VARCHAR 20).
ALTER TABLE orders ADD coupon_code VARCHAR(20);

-- Q20. Modify the payment_mode column to allow 30 characters instead of 20.
ALTER TABLE orders MODIFY payment_mode VARCHAR(30);


-- Q21. Rename the column order_date to purchase_date.
ALTER TABLE orders CHANGE order_date purchase_date DATE;

-- Q22. Add a column total_amount. Set its datatype as decimal(12,2)
ALTER TABLE orders ADD total_amount DECIMAL(12,2);

-- Q23. Update total_amount = quantity * price_per_unit for all orders
UPDATE orders SET total_amount = qty * price_per_unit;

-- Q24. Increase price_per_unit by 10% for all 'Furniture' category orders.
UPDATE orders 
SET price_per_unit = price_per_unit * 1.10 
WHERE category = 'Furniture';

-- Q25. Update payment_mode to NULL for orders placed before '2025-08-08'.
UPDATE orders 
SET payment_mode = NULL 
WHERE purchase_date < '2025-08-08';

