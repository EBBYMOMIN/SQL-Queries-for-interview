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

-- Create Database
CREATE DATABASE OnlineRetailDB;
GO

-- Use the Database
USE OnlineRetailDB;
GO

-- Create the Customers table
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

-- Create the Products table
CREATE TABLE Products (
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR (100),
	CategoryID INT,
	Price DECIMAL (10,2),
	Stocks INT,
	CreatedAt DATETIME DEFAULT GETDATE()
);

-- Create the Categories table
CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY IDENTITY (1,1),
	CategoryName NVARCHAR(100),
	Description NVARCHAR (255)
);

-- Create the Orders table
CREATE TABLE Orders(
	OrderID INT PRIMARY KEY IDENTITY(1,1),

);