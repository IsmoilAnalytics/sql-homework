create database F24_class1
use F24_class1


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

Select * from Employees
insert into Employees values (1, 'Hasan', 1400)
insert into Employees values (2, 'Ismoil', 1620)
insert into Employees values (3, 'Ali', 1000)
insert into Employees values
	(4, 'Rozimbek', 1400),
	(5, 'Sherzod',  2000),
	(6, 'Behruz',  3000)

	Select * from Employees

update Employees
set Salary = 1500
where EmpID = 1

delete Employees
where EmpID = 6


--Avval test_table nomli jadval yaratamiz va unga bazi malumotlar qoshamiz:


CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO test_table (name) VALUES ('Ali'), ('Vali'), ('Hasan'), ('Husan');
--2. DELETE ni sinab korish
--DELETE faqat berilgan shartga mos yozuvlarni ochiradi, ammo jadval oz joyida qoladi va AUTO_INCREMENT saqlanib qoladi.


DELETE FROM test_table WHERE id = 2;
SELECT * FROM test_table;
 --Natija: id = 2 bolgan qator ochadi, lekin qolganlari oz joyida turadi.

--id	name
--1	Ali
--3	Hasan
--4	Husan
--Agar yangi yozuv qoshsak:


INSERT INTO test_table (name) VALUES ('Karim');
SELECT * FROM test_table;
 --Natija: id = 5 boladi, chunki AUTO_INCREMENT saqlanadi.


--3. TRUNCATE ni sinab korish
--TRUNCATE barcha yozuvlarni tozalaydi, lekin jadval qoladi.


TRUNCATE TABLE test_table;
SELECT * FROM test_table;
--Natija: Barcha yozuvlar ochadi, lekin jadval tuzilishi saqlanadi.

INSERT INTO test_table (name) VALUES ('Karim');
SELECT * FROM test_table;
--Natija: AUTO_INCREMENT 1 dan boshlanadi, chunki TRUNCATE sanogini tiklaydi.

--id	name
--1	Karim
--4. DROP ni sinab korish
--DROP jadvalni butunlay ochirib tashlaydi, uning strukturasini ham yoq qiladi.


DROP TABLE test_table;
SELECT * FROM test_table;
--Natija: Xatolik (Unknown table 'test_table'), chunki jadval yoq bolib ketdi.
--Agar qayta foydalanish kerak bolsa, CREATE TABLE bilan qaytadan yaratish kerak boladi.


--Modify the Name column in the Employees table to VARCHAR(100).

Alter table Employees
alter column Name varchar(100)
select * from Employees

--Add a new column Department (VARCHAR(50)) to the Employees table.
Alter table Employees
add Department varchar(50)

select * from Employees

--Change the data type of the Salary column to FLOAT.

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

select * from Employees

--Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

Select * from Departments

--Remove all records from the Employees table without deleting its structure.

DELETE FROM Employees;

Insert into Departments select * from Employees where EmpID <= 5

INSERT INTO Departments VALUES 
    (1, 'IT'),
    (2, 'Finance'),
    (3, 'HR'),
    (4, 'Marketing'),
    (5, 'Doctor'),
    (6, 'Sales');

	select * from Departments

	Alter table Departments
	add Salary float

	UPDATE Departments
SET Salary = 
    CASE DepartmentID
        WHEN 1 THEN 6400
        WHEN 2 THEN 4900
        WHEN 3 THEN 5400
        WHEN 4 THEN 7200
        WHEN 5 THEN 3000
        WHEN 6 THEN 6450
    END;

	update Departments
	set DepartmentName = 'Management'
	where Salary > 5000

	TRUNCATE TABLE Employees

	ALTER TABLE Employees
	DROP COLUMN Department

	EXEC sp_rename 'Employees', 'StaffMembers';
	select * from StaffMembers

	DROP TABLE Departments;

	CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),         
    Category VARCHAR(50),             
    Price DECIMAL(10,2),             
    StockQuantity INT);

	SELECT * FROM Products

	ALTER TABLE Products
	ADD CONSTRAINT check_Price CHECK (Price > 0);

	UPDATE Products
	SET StockQuantity = 50
	WHERE StockQuantity IS NULL;

	INSERT INTO Products  VALUES
	(1, 'Laptop', 'Electronics', 1200.99, 30),
	(2, 'Smartphone', 'Electronics', 799.50, 50),
	(3, 'Office Chair', 'Furniture', 150.75, 20),
	(4,'Running Shoes', 'Footwear', 95.00, 100),
	(5, 'Coffee Maker', 'Appliances', 45.99, 15);


	SELECT * INTO Products_Backup 
	FROM Products;

	SELECT * FROM Products_Backup;

	EXEC sp_rename 'Products', 'Inventory';

	Alter table Inventory
	Alter column Price float
