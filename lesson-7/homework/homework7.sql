create database F24_class7
use F24_class7

create table Product(
	Id int primary key,
	Product_name varchar(50),
	Price decimal(10,2),
);

select * from Product

insert into Product (Id, Product_name, Price)
values 
(1, 'Laptop', 500),
(2, 'Phone', 800),
(3, 'Planshet', 400),
(4, 'TV', 100),
(5, 'Computer', 350),
(6, 'Tablet', 250);

select MIN(Price) from Product  -- Bu Product jadvalidagi Price column ning eng kichik narxini chiqarib beradi

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees(EmpID, EmpName, Department, Salary) VALUES
(1, 'John', 'HR', 50000),
(2, 'Mary', 'IT', 70000),
(3, 'Steve', 'IT', 72000),
(4, 'Sara', 'Finance', 60000),
(5, 'Mike', 'HR', 55000);

SELECT * FROM Employees
select MAX(Salary) from Employees -- bu Employees jadvalidagi salary ning eng katta qiymatini chiqarib beradi

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Status VARCHAR(10),
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Status) VALUES
(1, 'Ali', 'Karimov', 'ali.karimov@example.com', '+998901234567', 'Active'),
(2, 'Zarina', 'Tursunova', 'zarina.t@example.com', '+998935678901', 'Inactive'),
(3, 'Javohir', 'Raximov', 'javohir.r@example.com', '+998977654321', 'Active'),
(4, 'Shahlo', 'Oripova', 'shahlo.o@example.com', '+998901112233', 'Active'),
(5, 'Bekzod', 'Hamidov', 'bekzod.h@example.com', '+998994445566', 'Inactive');

SELECT * FROM Customers

SELECT COUNT(*) AS ToatalCustomers from Customers

--Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.

CREATE TABLE Products (
    ProductID INT  PRIMARY KEY ,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Headphones', 'Accessories', 150.00),
(4, 'Charger', 'Accessories', 20.00),
(5, 'Office Chair', 'Furniture', 250.00),
(6, 'Desk', 'Furniture', 300.00),
(7, 'Tablet', 'Electronics', 600.00);

SELECT  COUNT(DISTINCT Category) AS UniqueCategories FROM Products;

-- Total (SUM) sales amount for product with id 7
SELECT SUM(Amount) AS TotalSales
FROM Sales
WHERE ProductID = 7;

-- Average (AVG) age of employees
SELECT AVG(Age) AS AverageAge
FROM Employees;

-- Count of employees in each department
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;

-- Minimum and Maximum Price of products grouped by Category
SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

-- Total (SUM) sales per Customer
SELECT CustomerID, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

-- Departments having more than 5 employees
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;

-- Total sales and average sales for each product category
SELECT p.Category, SUM(s.Amount) AS TotalSales, AVG(s.Amount) AS AverageSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

-- Count of employees from the Department HR
SELECT COUNT(*) AS HR_EmployeeCount
FROM Employees
WHERE DepartmentName = 'HR';

-- Highest (MAX) and lowest (MIN) Salary by department
SELECT DepartmentName, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DepartmentName;

-- Average salary per Department
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName;

-- AVG salary and COUNT(*) of employees working in each department
SELECT DepartmentName, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;

-- Product categories with an average price greater than 400
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

-- Total sales for each year
SELECT YEAR(SaleDate) AS SaleYear, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

-- Number of customers who placed at least 3 orders
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;

-- Departments with total salary expenses greater than 500,000
SELECT DepartmentName, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentName
HAVING SUM(Salary) > 500000;

-- Average sales for each product category, filtering those with an average sales amount greater than 200
SELECT p.Category, AVG(s.Amount) AS AverageSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category
HAVING AVG(s.Amount) > 200;

-- Total sales for each Customer, filtering those with total sales over 1500
SELECT CustomerID, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(Amount) > 1500;

-- Total and average salary of employees grouped by department, filtering departments with an average salary greater than 65000
SELECT DepartmentName, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;

-- Maximum and minimum order value for each customer, excluding customers with an order value less than 50
SELECT CustomerID, MAX(Amount) AS MaxOrder, MIN(Amount) AS MinOrder
FROM Orders
GROUP BY CustomerID
HAVING MIN(Amount) >= 50;

-- Total sales and count of distinct products sold in each month, filtering months with more than 8 products sold
SELECT MONTH(SaleDate) AS SaleMonth, SUM(Amount) AS TotalSales, COUNT(DISTINCT ProductID) AS DistinctProducts
FROM Sales
GROUP BY MONTH(SaleDate)
HAVING COUNT(DISTINCT ProductID) > 8;

-- MIN and MAX order quantity per Year
SELECT YEAR(OrderDate) AS OrderYear, MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate);
