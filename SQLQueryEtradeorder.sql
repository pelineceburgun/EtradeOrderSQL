INSERT INTO Users (username, email, password, address) VALUES
('charlieee', 'charlie@example.com', 'password123','' )


INSERT INTO PaymentTypes ([payment_tipe name]) VALUES
('Credit Card')
  

INSERT INTO Products (product_name, price, category) VALUES
('Mens T-Shirt', 19.99, 'clothing' ),
('Womens Jeans', 39.99,  'clothing' ),
('Unisex Hoodie', 29.99,  'clothing' )


INSERT INTO [Stock Situation] (stock_number, quantity) VALUES
(1, 150), -- Laptop
(2, 300), -- Smartphone
(3, 100), -- Headphones
(4, 200), -- Tablet
(5, 250) -- Smartwatch


INSERT INTO Orders (user_id, payment_type_id, order_status, total_amount, order_date) VALUES
(1, 1, 'Pending', 1049.98, '2024-08-01 10:15:30'), 
(2, 2, 'Shipped', 499.99, '2024-08-02 14:20:45'), 
(3, 3, 'Delivered', 149.99, '2024-08-03 08:10:20'), 
(1, 1, 'Pending', 39.99, '2024-08-04 16:30:00'), 
(2, 2, 'Cancelled', 59.99, '2024-08-05 09:45:15') 


INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99), -- Order 1: 1 x Laptop
(1, 7, 1, 29.99),  -- Order 1: 1 x Wireless Mouse
(2, 2, 1, 499.99), -- Order 2: 1 x Smartphone
(3, 3, 1, 149.99), -- Order 3: 1 x Headphones
(4, 13, 2, 3.49),  -- Order 4: 2 x Whole Wheat Bread
(4, 14, 1, 4.99)  -- Order 4: 1 x Almond Milk


												-- SAMPLE QUERIES
SELECT * 
FROM OrderItem
WHERE Price>= 500 --lists all records where price is greater than a certain amount

SELECT * 
FROM Orders
WHERE user_id=1 --brings user 1's orders

SELECT * 
FROM Products
WHERE category='stationery' AND price<100 --brings certain category&less than an amount from products

SELECT * 
FROM [Stock Situation]
WHERE quantity>100 

SELECT 
    O.order_id,
    O.order_date,
    P.product_name,
    OI.quantity,
    OI.price,
    (OI.quantity * OI.price) AS total_price
FROM Orders O
JOIN OrderItem OI ON O.order_id = OI.order_id
JOIN Products P ON OI.product_id = P.product_id
WHERE O.user_id = 1 -- brings user 1's all orders,product ingredients,total spent amount
ORDER BY O.order_date DESC;

SELECT P.product_name, SS.quantity    
FROM [Stock Situation] AS SS
JOIN Products P ON SS.product_id = P.product_id
WHERE SS.quantity < 50
ORDER BY SS.quantity ASC;  --products about to run out of stock

SELECT SUM(O.total_amount) AS total_sales
FROM Orders O
WHERE O.order_date BETWEEN '2024-08-01' AND '2024-08-10'; --sum of all orders between a certain time amount

SELECT P.product_name, 
SUM(OI.quantity) AS total_ordered
FROM OrderItem OI
JOIN Products P ON OI.product_id = P.product_id
GROUP BY P.product_name
ORDER BY total_ordered DESC -- shows most ordered item first

SELECT O.order_id, O.order_date, P.product_name,OI.quantity, OI.price,
       (OI.quantity * OI.price) AS total_price
FROM Orders O
JOIN OrderItem OI ON O.order_id = OI.order_id
JOIN Products P ON OI.product_id = P.product_id
WHERE O.user_id = 1 -- last order details of a certain user
ORDER BY O.order_date DESC

SELECT U.username,
SUM(O.total_amount) AS total_spent
FROM Users U
JOIN Orders O ON U.user_id = O.user_id
GROUP BY U.username
ORDER BY total_spent DESC; --lists total spent of a certain user
