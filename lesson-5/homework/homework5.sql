-- 1. ProductName ustunini Name deb nomlash
SELECT ProductName AS Name FROM Products;

-- 2. Customers jadvalini Client deb nomlash
SELECT * FROM Customers AS Client;

-- 3. UNION yordamida Products va Products_Discounted jadvalidan ProductName olish
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 4. Products va Products_Discounted jadvali kesishmasini topish
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 5. Takrorlanmagan mijoz ismlari va ularning mamlakatlari
SELECT DISTINCT FirstName, Country FROM Customers;

-- 6. CASE yordamida narxga qarab kategoriya qo‘shish
SELECT ProductName, Price, 
       CASE 
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;

-- 7. IIF yordamida omborda ko‘p yoki kam ekanligini ko‘rsatish
SELECT ProductName, StockQuantity, 
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;

-- 8. UNION yordamida Products va OutOfStock jadvalidan ProductName olish
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;

-- 9. Products va Products_Discounted jadvali farqini topish
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

-- 10. IIF yordamida mahsulot qimmat yoki arzonligini ko‘rsatish
SELECT ProductName, Price, 
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

-- 11. Yoshi 25 dan kichik yoki maoshi 60000 dan katta bo‘lgan xodimlarni topish
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 60000;

-- 12. Xodimning ish haqi oshirilishi
UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'HR' OR EmployeeID = 5;

-- 13. Products va Products_Discounted jadvalining kesishmasini chiqarish
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;

-- 14. Savdo miqdoriga qarab kategoriya berish
SELECT SaleAmount, 
       CASE 
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS SaleCategory
FROM Sales;

-- 15. Buyurtma berib, lekin faktura olmagan mijozlar
SELECT CustomerID FROM Orders
EXCEPT
SELECT CustomerID FROM Invoices;

-- 16. Mijoz buyurtma miqdoriga qarab chegirma olish
SELECT CustomerID, Quantity,
       CASE 
           WHEN Quantity > 3 THEN '3%'
           WHEN Quantity BETWEEN 1 AND 3 THEN '5%'
           ELSE '7%'
       END AS Discount
FROM Orders;
