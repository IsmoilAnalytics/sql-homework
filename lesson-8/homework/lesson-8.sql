-- 1. Har bir kategoriyadagi umumiy mahsulotlar sonini aniqlash
SELECT Category, COUNT(*) AS TotalProducts 
FROM Products 
GROUP BY Category;

-- 2. 'Electronics' kategoriyasidagi mahsulotlarning o‘rtacha narxini aniqlash
SELECT AVG(Price) AS AvgPrice 
FROM Products 
WHERE Category = 'Electronics';

-- 3. Shahar nomi 'L' harfi bilan boshlanuvchi mijozlarni ro‘yxatga olish
SELECT * 
FROM Customers 
WHERE City LIKE 'L%';

-- 4. Nomlari 'er' bilan tugaydigan mahsulotlarni topish
SELECT ProductName 
FROM Products 
WHERE ProductName LIKE '%er';

-- 5. Nomlari 'A' harfi bilan tugaydigan davlatlardagi mijozlarni chiqarish
SELECT * 
FROM Customers 
WHERE Country LIKE '%A';

-- 6. Eng yuqori narxdagi mahsulotni topish
SELECT MAX(Price) AS HighestPrice 
FROM Products;

-- 7. Mahsulot zaxirasini 'Low Stock' yoki 'Sufficient' deb belgilash
SELECT ProductName, StockQuantity, 
       IIF(StockQuantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;

-- 8. Har bir mamlakatdagi umumiy mijozlar sonini aniqlash
SELECT Country, COUNT(*) AS TotalCustomers 
FROM Customers 
GROUP BY Country;

-- 9. Eng kam va eng ko‘p buyurtma miqdorini topish
SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity 
FROM Orders;

-- 10. 2023 yilda buyurtma bergan, lekin hisob-fakturalari yo‘q mijozlarni topish
SELECT CustomerID 
FROM Orders 
WHERE YEAR(OrderDate) = 2023
EXCEPT 
SELECT CustomerID 
FROM Invoices;

-- 11. Mahsulot nomlarini Products va Products_Discounted jadvallaridan nusxalari bilan birlashtirish
SELECT ProductName FROM Products 
UNION ALL 
SELECT ProductName FROM Products_Discounted;

-- 12. Mahsulot nomlarini takrorlanmas holda birlashtirish
SELECT ProductName FROM Products 
UNION 
SELECT ProductName FROM Products_Discounted;

-- 13. Har bir yil bo‘yicha buyurtmalarning o‘rtacha summasini topish
SELECT YEAR(OrderDate) AS OrderYear, AVG(TotalAmount) AS AvgOrderAmount 
FROM Orders 
GROUP BY YEAR(OrderDate);

-- 14. Mahsulotlarni narxiga qarab guruhlash
SELECT ProductName, Price, 
       CASE 
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           ELSE 'High'
       END AS PriceGroup
FROM Products;

-- 15. Takrorlanmas mijoz yashaydigan shaharlarni alfavit bo‘yicha saralash
SELECT DISTINCT City 
FROM Customers 
ORDER BY City;

-- 16. Har bir mahsulot bo‘yicha umumiy sotilgan miqdorni topish
SELECT ProductID, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY ProductID;

-- 17. Nomida 'oo' mavjud mahsulotlarni topish
SELECT ProductName 
FROM Products 
WHERE ProductName LIKE '%oo%';

-- 18. Products va Products_Discounted jadvallaridagi umumiy ProductID larni topish
SELECT ProductID 
FROM Products 
INTERSECT 
SELECT ProductID 
FROM Products_Discounted;
-- 19. Eng ko‘p umumiy hisob-faktura summasiga ega 3 ta eng yaxshi mijoz
SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent 
FROM Invoices 
GROUP BY CustomerID 
ORDER BY TotalSpent DESC;

-- 20. Products jadvalida bor, lekin Products_Discounted da yo‘q mahsulotlarni topish
SELECT ProductID, ProductName 
FROM Products 
WHERE ProductID NOT IN (SELECT ProductID FROM Products_Discounted);

-- 21. Mahsulotlar va savdo jadvallarini JOIN qilib, mahsulot nomlari va sotilgan sonini chiqarish
SELECT P.ProductName, COUNT(S.SaleID) AS TotalSold 
FROM Products P 
LEFT JOIN Sales S ON P.ProductID = S.ProductID 
GROUP BY P.ProductName;

-- 22. Eng ko‘p buyurtma qilingan 5 ta mahsulotni topish
SELECT TOP 5 ProductID, SUM(Quantity) AS TotalOrdered 
FROM Orders 
GROUP BY ProductID 
ORDER BY TotalOrdered DESC;
