--  Easy-Level Tasks

-- BULK INSERT TableName
FROM 'C:\Path\To\File.csv'
WITH (
    FORMAT='CSV',
    FIELDTERMINATOR = ',',  -- Maydonlar ajratuvchisi (masalan, vergul)
    ROWTERMINATOR = '\n',   -- Yangi qatorni ajratish belgisi
    FIRSTROW = 2            -- Fayldagi birinchi qator (sarlavha bo'lsa, 2 dan boshlanadi)
-- 2. SQL Server ga import qilinishi mumkin bo‘lgan 4 ta fayl formati:
--    - CSV (Comma-Separated Values)
--    - TXT (Text files)
--    - XML (Extensible Markup Language)
--    - JSON (JavaScript Object Notation)

-- 3. Products jadvalini yaratish
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 4. Uchta yozuv qo‘shish
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.00);

-- 5. NULL va NOT NULL farqi
-- NULL: qiymat yo‘qligini bildiradi.
-- NOT NULL: maydon doimo qiymatga ega bo‘lishi kerak.

-- 6. UNIQUE constraint qo‘shish
ALTER TABLE Products ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

-- 7. SQL kodga izoh qo‘shish
-- Bu kod mahsulotlar jadvalini yaratadi
drop table if exists Categories;
-- 8. Categories jadvalini yaratish
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- 9. IDENTITY ustunining maqsadi:
-- IDENTITY avtomatik ravishda unikal qiymatlar yaratadi.

--  Medium-Level Tasks

-- 10. BULK INSERT orqali ma'lumot yuklash
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 11. FOREIGN KEY yaratish
ALTER TABLE Products ADD CategoryID INT;
ALTER TABLE Products ADD CONSTRAINT FK_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

-- 12. PRIMARY KEY va UNIQUE KEY farqi:
-- PRIMARY KEY - har bir qator uchun unikal bo‘lishi shart va NULL bo‘lishi mumkin emas.
-- UNIQUE KEY - unikal bo‘lishi kerak, lekin NULL qiymatga ruxsat beradi.

-- 13. CHECK constraint qo‘shish (Price > 0 bo‘lishi shart)
ALTER TABLE Products ADD CONSTRAINT CHK_Price CHECK (Price > 0);

-- 14. Stock ustuni qo‘shish
ALTER TABLE Products ADD Stock INT NOT NULL;

-- 15. ISNULL bilan NULL qiymatlarni almashtirish
SELECT ProductName, ISNULL(Price, 0) AS Price FROM Products;

-- 16. FOREIGN KEY constraintning vazifasi:
-- Bu boshqa jadvaldagi qiymatlar bilan bog‘liqlikni ta’minlaydi va ma’lumotlarning yaxlitligini saqlaydi.

--  Hard-Level Tasks

-- 17. Customers jadvalini yaratish va CHECK constraint qo‘shish
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

-- 18. IDENTITY column bilan jadval yaratish (100 dan boshlab 10 qadam bilan ortadi)
CREATE TABLE Orders (
    OrderID INT IDENTITY(100,10) PRIMARY KEY,
    OrderDate DATE
);

-- 19. Composite PRIMARY KEY yaratish (OrderID va ProductID birgalikda primary key)
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- 20. COALESCE va ISNULL farqi
SELECT ProductName, ISNULL(Price, 0) AS Price_Using_ISNULL, COALESCE(Price, 0) AS Price_Using_COALESCE FROM Products;

-- 21. Employees jadvalini yaratish va PRIMARY hamda UNIQUE constraintlar qo‘shish
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- 22. FOREIGN KEY yaratish ON DELETE CASCADE va ON UPDATE CASCADE bilan
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
