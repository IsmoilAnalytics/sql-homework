-- 🟢 Easy-Level Tasks

-- 1. Products va Suppliers jadvallari uchun barcha kombinatsiyalar
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;

-- 2. Departments va Employees jadvallari uchun barcha kombinatsiyalar
SELECT d.DepartmentName, e.Name
FROM Departments d
CROSS JOIN Employees e;

-- 3. Suppliers mahsulot yetkazib bergan holatlar
SELECT s.SupplierName, p.ProductName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;

-- 4. Buyurtmalar va mijozlar ro‘yxati
SELECT c.FirstName, c.LastName, o.OrderID
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 5. Talabalar va kurslar kombinatsiyasi
SELECT s.Name AS StudentName, c.CourseName
FROM Students s
CROSS JOIN Courses c;

-- 6. Products va Orders mos keladiganlari
SELECT p.ProductName, o.OrderID
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID;

-- 7. Bo‘lim IDsi mos keladigan hodimlar ro‘yxati
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 8. Talabalar va kurs IDlari
SELECT s.Name AS StudentName, e.CourseID
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;

-- 9. To‘lov qilingan buyurtmalar
SELECT o.OrderID, p.PaymentID
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;

-- 10. Narxi 100 dan yuqori mahsulotlar buyurtmalari
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100;

-- 🟡 Medium-Level Tasks

-- 1. DepartmentID mos kelmaydigan xodimlar va bo‘limlar ro‘yxati
SELECT e.Name, d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;

-- 2. Buyurtma miqdori ombor miqdoridan katta bo‘lgan buyurtmalar
SELECT o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity;

-- 3. Savdo miqdori 500 dan ko‘p bo‘lgan mijozlar va mahsulotlar
SELECT c.FirstName, c.LastName, s.ProductID
FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE s.SaleAmount >= 500;

-- 4. Talabalar va ularning kurslari
SELECT s.Name, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- 5. "Tech" so‘zi mavjud yetkazib beruvchilar mahsulotlari
SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

-- 6. To‘lov summasi jami summadan kam bo‘lgan buyurtmalar
SELECT o.OrderID, p.Amount AS PaymentAmount, o.TotalAmount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

-- 7. Maoshi boshlig‘inikidan katta bo‘lgan hodimlar
SELECT e1.Name AS EmployeeName, e1.Salary, e2.Name AS ManagerName, e2.Salary AS ManagerSalary
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
WHERE e1.Salary > e2.Salary;

-- 8. "Electronics" yoki "Furniture" kategoriyasidagi mahsulotlar
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

-- 🟢 Hard-Level Tasks

-- 1. Har xil bo‘limdagi xodim juftliklari
SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
INNER JOIN Employees e2 ON e1.DepartmentID <> e2.DepartmentID;

-- 2. To‘lov miqdori (miqdor × narx) bilan teng bo‘lmagan to‘lovlar
SELECT o.OrderID, p.PaymentID, p.Amount, (o.Quantity * pr.Price) AS ExpectedAmount
FROM Payments p
INNER JOIN Orders o ON p.OrderID = o.OrderID
INNER JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

-- 3. Hech qanday kursga yozilmagan talabalar
SELECT s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

-- 4. Bo‘ysunuvchilari bor, lekin maoshi ularnikidan kam bo‘lgan boshqaruvchilar
SELECT m.Name AS ManagerName, m.Salary, e.Name AS EmployeeName, e.Salary AS EmployeeSalary
FROM Employees m
INNER JOIN Employees e ON m.EmployeeID = e.ManagerID
WHERE m.Salary <= e.Salary;

-- 5. Buyurtma qilgan, lekin to‘lov qilmagan mijozlar
SELECT DISTINCT c.FirstName, c.LastName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
