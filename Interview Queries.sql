/*
====================================================================================
Project for a "Online Retail Company"
This project will cover creating database, tables, and indexes, inserting data,
and writing various queries for reporting and data analytics
====================================================================================

Project Overview: Online Retail Company
------------------------------------------------------------------------------------
A> DATABASE DESIGN
	-- Database Name - OnlineRetailDB

B> TABLES
	-- Customers: Stores customers details
	-- Orders: Stores order details
	-- OrderItems: Stores details of each item in an order
	-- Categories: Stores product categories

C> INSERT SAMPLE DATA
	-- Populate each table with sample data

D> WRITE QUERIES
	-- Retrieve data (eg. customer orders, popular products)
	-- Perform aggregations (eg. total sales, average sales, average order value)
	-- Join Tables for comprehensive reports
	-- Use subqueries and common table expressions (CTEs)
------------------------------------------------------------------------------------
*/
/*
====================================================================================
								PROJECT START
====================================================================================
*/

/*
====================================================================================
								Insert Queries
====================================================================================
*/

-- Create Database --
CREATE DATABASE OnlineRetailDB;
GO

-- Use the Database --
USE OnlineRetailDB;
GO

-- Create the Customers table --
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR (50),
	LastName NVARCHAR (50),
	Email NVARCHAR (100),
	Phone NVARCHAR (25),
	Address NVARCHAR (255),
	City NVARCHAR (50),
	State NVARCHAR (50),
	Zipcode NVARCHAR (50),
	Country NVARCHAR (50),
	CreatedAt DATETIME DEFAULT GETDATE()
);

-- Create the Products table --
CREATE TABLE Products (
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR (100),
	CategoryID INT,
	Price DECIMAL (10,2),
	Stocks INT,
	CreatedAt DATETIME DEFAULT GETDATE()
);

-- Create the Categories table --
CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY IDENTITY (1,1),
	CategoryName NVARCHAR(100),
	Description NVARCHAR (255)
);

-- Create the Orders table --
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	OrderDate DATETIME DEFAULT GETDATE(),
	TotalAmount DECIMAL (10,2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

-- Create the OrderItems table --
CREATE TABLE OrderItems(
	OrderItemID INT PRIMARY KEY IDENTITY (1,1),
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price DECIMAL (10,2),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Sample data into Categories table
INSERT INTO Categories(CategoryName, Description)
VALUES
('Electronics', 'Devices and gadgets like phones, laptops, and accessories'),
('Clothing', 'Men�s and Women�s apparel'),
('Home & Kitchen', 'Furniture, appliances, and kitchen essentials'),
('Books', 'Educational, fiction, and non-fiction books'),
('Health & Beauty', 'Skincare, supplements, and wellness products'),
('Sports & Outdoors', 'Fitness gear, sports equipment, and outdoor accessories'),
('Toys & Games', 'Children�s toys, board games, and puzzles'),
('Automotive', 'Car accessories, tools, and maintenance products'),
('Groceries', 'Food items, beverages, and household essentials'),
('Jewelry & Accessories', 'Watches, necklaces, and fashion accessories');

-- Insert Sample data into Products table
INSERT INTO Products (ProductName, CategoryID, Price, Stocks)
VALUES
('Smartphone', 1, 699.99, 50),
('Laptop', 1, 1199.99, 30),
('Wireless Earbuds', 1, 149.99, 100),
('Mens T-Shirt', 2, 19.99, 200),
('Womens Jeans', 2, 49.99, 150),
('Microwave Oven', 3, 129.99, 40),
('Non-Stick Frying Pan', 3, 29.99, 80),
('Fiction Novel', 4, 14.99, 500),
('Educational Book', 4, 24.99, 300),
('Vitamin Supplements', 5, 39.99, 120),
('Yoga Mat', 6, 25.99, 90),
('Football', 6, 19.99, 75),
('Board Game', 7, 34.99, 60),
('Car Phone Holder', 8, 12.99, 110),
('Organic Rice', 9, 9.99, 500),
('Silver Necklace', 10, 89.99, 40);
('Keyboard', 1, 59.99, 0)

-- Insert Sample data into Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, Zipcode, Country)
VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '+91-9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '+91-8765432109', '45 Green Park', 'Delhi', 'Delhi', '110001', 'India'),
('Rahul', 'Mehta', 'rahul.mehta@example.com', '+91-7654321098', '78 Central Street', 'Bangalore', 'Karnataka', '560001', 'India'),
('Sneha', 'Patil', 'sneha.patil@example.com', '+91-6543210987', '56 Lake View Road', 'Pune', 'Maharashtra', '411001', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '+91-5432109876', '88 Rajendra Nagar', 'Hyderabad', 'Telangana', '500001', 'India'),
('Anjali', 'Das', 'anjali.das@example.com', '+91-4321098765', '22 Park Street', 'Kolkata', 'West Bengal', '700001', 'India'),
('Rohan', 'Kapoor', 'rohan.kapoor@example.com', '+91-3210987654', '90 MG Road', 'Chennai', 'Tamil Nadu', '600001', 'India'),
('Meera', 'Nair', 'meera.nair@example.com', '+91-2109876543', '33 Residency Road', 'Cochin', 'Kerala', '682001', 'India'),
('Suresh', 'Yadav', 'suresh.yadav@example.com', '+91-1098765432', '76 Gandhi Path', 'Jaipur', 'Rajasthan', '302001', 'India'),
('Neha', 'Malhotra', 'neha.malhotra@example.com', '+91-9876012345', '12 Civil Lines', 'Lucknow', 'Uttar Pradesh', '226001', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '+91-9875873210', '123 GG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Arjun', 'Reddy', 'arjun.reddy@example.com', '+91-9876541234', '99 Jubilee Hills', 'Hyderabad', 'Telangana', '500034', 'India')('John', 'Doe', 'john.doe@example.com', '+1-555-1234567', '100 Main St', 'New York', 'NY', '10001', 'USA'),
('Emma', 'Johnson', 'emma.johnson@example.com', '+1-555-2345678', '500 Market St', 'San Francisco', 'CA', '94105', 'USA'),
('James', 'Smith', 'james.smith@example.co.uk', '+44-20-79460000', '15 Baker Street', 'London', '', 'W1U 3BW', 'UK'),
('Olivia', 'Brown', 'olivia.brown@example.co.uk', '+44-161-3456789', '23 King Street', 'Manchester', '', 'M2 4LQ', 'UK'),
('Liam', 'Wilson', 'liam.wilson@example.ca', '+1-416-9876543', '78 Queen St', 'Toronto', 'Ontario', 'M5V 2T6', 'Canada'),
('Sophia', 'Martinez', 'sophia.martinez@example.ca', '+1-604-7654321', '212 Robson St', 'Vancouver', 'British Columbia', 'V6B 6P5', 'Canada');

-- Insert Sample data into Orders table
INSERT INTO Orders(CustomerID, OrderDate, TotalAmount)
VALUES
(1, GETDATE(), 749.98),
(2, GETDATE(), 1199.99),
(3, GETDATE(), 39.99),
(4, GETDATE(), 149.99),
(5, GETDATE(), 59.98),
(6, GETDATE(), 24.99),
(7, GETDATE(), 299.99),
(8, GETDATE(), 499.99),
(9, GETDATE(), 79.99),
(10, GETDATE(), 999.99);

-- Insert Sample data into OrderItems table
INSERT INTO OrderItems(OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 699.99),  -- Smartphone for Order 1
(1, 3, 1, 49.99),   -- Wireless Earbuds for Order 1
(2, 2, 1, 1199.99), -- Laptop for Order 2
(3, 10, 1, 39.99),  -- Vitamin Supplements for Order 3
(4, 3, 1, 149.99),  -- Wireless Earbuds for Order 4
(5, 4, 2, 19.99),   -- Men's T-Shirts for Order 5
(6, 9, 1, 24.99),   -- Educational Book for Order 6
(7, 6, 1, 129.99),  -- Microwave Oven for Order 7
(7, 7, 2, 29.99),   -- Non-Stick Frying Pan for Order 7
(8, 8, 3, 14.99),   -- Fiction Novels for Order 8
(9, 11, 2, 25.99),  -- Yoga Mats for Order 9
(10, 2, 1, 999.99); -- Laptop for Order 10

/*
====================================================================================
									Queries
====================================================================================
*/

1 -- Retrieve all orders for a specific customer.
SELECT o.OrderID, o.OrderDate, o.TotalAmount, oi.ProductID, p.ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE o.CustomerID = 1;

2 -- Find the total sales for each product.
SELECT p.ProductID, p.ProductName, SUM(oi.Quantity * oi.Price) AS TotalSales
FROM OrderItems oi
JOIN Products p
ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;

3 -- Calculate the average order value.
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders

4 --List the top 5 customers by total spending.
SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpending DESC

5 -- Retrieve the most popular product category.
WITH CategorySales AS (
    SELECT c.CategoryID, c.CategoryName, SUM(oi.Quantity) AS TotalQuantitiesSold,
    ROW_NUMBER() OVER (ORDER BY SUM(oi.Quantity) DESC) AS rn
    FROM OrderItems oi
    JOIN Products p ON oi.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryID, c.CategoryName
)
SELECT CategoryID, CategoryName, TotalQuantitiesSold 
FROM CategorySales 
WHERE rn = 1;

6 -- List all products that are out of stock
SELECT * FROM Products
WHERE Stocks = 0;

SELECT ProductID, ProductName, Stocks
FROM Products WHERE Stocks = 0;

-------with catgory-------
SELECT p.ProductID, p.ProductName, c.CategoryName, p.Stocks
FROM Products p
JOIN Categories c ON c.CategoryID = p.CategoryID
WHERE Stocks = 0;

7 -- Find customers who placed orders in last 30 days
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(DAY,-30,GETDATE());

8 -- Calculate the total number of orders placed each month.
SELECT	YEAR(OrderDate) AS OrderYear,
		MONTH(OrderDate) AS OrderMonth,
		COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

9 -- Retrieve the details of the most recent order.
SELECT TOP 2 o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

10 -- Find the average price of products in each category.
SELECT c.CategoryID, c.CategoryName, AVG(p.Price) AS AveragePrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

11 -- List customers who have never placed an order.
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, o.OrderID, o.TotalAmount
FROM Customers c
FULL JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

12 -- Retrieve the total quantities sold for each product.
SELECT  p.ProductID, p.ProductName, SUM(oi.Quantity) AS TotalSales
FROM Products p
JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductName;

13 -- Calculate the total revenue generated from each category.
SELECT c.CategoryID, c.CategoryName AS Categories, SUM(oi.Quantity * oi.Price) AS TotalRevenue
FROM Categories c
JOIN Products p ON p.CategoryID = c.CategoryID
JOIN OrderItems oi ON oi.ProductID = p.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalRevenue DESC;

14 --Find the highest-priced product in each category.
SELECT  c.CategoryName,c.CategoryID, p1.ProductID, p1.ProductName, p1.Price
FROM Categories c
JOIN Products p1 ON c.CategoryID = p1.CategoryID
WHERE p1.Price = (SELECT MAX(Price)
				  FROM Products p2
				  WHERE p2.CategoryID = p1.CategoryID)
ORDER BY p1.Price DESC;

15 --Retrieve orders with a total amount greater than a specific value (e.g. $500)
SELECT oi.OrderID, o.TotalAmount
FROM OrderItems oi
JOIN Orders o ON o.OrderID = oi.OrderID
WHERE o.TotalAmount > 500
ORDER BY o.TotalAmount DESC;

16 -- List products along with the number of orders they appear in.
SELECT p.ProductID, p.ProductName, COUNT(oi.OrderID) AS 'Total Orders'
FROM Products p
JOIN OrderItems oi ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY 'Total Orders' DESC;

17 -- Find the top 3 most frequently ordered products.
SELECT TOP 3 p.ProductID, p.ProductName, COUNT(oi.OrderID) AS OrderCount
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY OrderCount DESC;

18 -- Calculate the total number of customers from each country.
SELECT Country, COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Country
ORDER BY TotalCustomers DESC;

19 -- Retreive the list of customers along with their total spending.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

20 -- List orders with more than a specified number of items (eg. 2 items)
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, COUNT(oi.OrderItemID) AS NumberOfItems
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(oi.OrderItemID) = 2
ORDER BY NumberOfItems;