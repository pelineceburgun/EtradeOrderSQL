# EtradeOrderSQL
This project is a simulation of an E-commerce Order Management System, designed to manage and track user orders, products, payment information, and stock levels.
The system includes key functionalities such as order status tracking, inventory management with automatic updates, and user purchase history reporting. It is intended to serve as a medium-difficulty project for those looking to enhance their SQL and database design skills.You can find related pictures&database diagram(which i used dbdiagram.io for),you can also find an Excel file for data visualization.

Features:

Users: Stores user information and credentials.
Products: Holds details of the products available for purchase.
Orders: Captures order details, including user ID, payment type, status, and total amount.
OrderItems: Links products to specific orders, tracking the quantity and price of each item.
PaymentTypes: Defines the available payment methods.
StockSituation: Manages product inventory levels.
--Data Types--
OrderItem:
order_id int
product_id int
quantity int
price decimal(10,2)

Orders:
order_id int
user_id int
user_address text
payment_type_id int 
order_status varchar(50)
total_amount decimal(10,2)
order_date datetime

PaymentTypes:
payment_type_id int
payment_tipe_name varchar(50)

Products:
product_id int
product_name varchar(100)
stock number varchar(50)
category varchar(50)
price   decimal(10,2)

Stock Situation:
product_id int
stock_number int
quantity int
Users:
user_id int
username varchar(50)
email varchar(100)
password varchar(100)
address text

