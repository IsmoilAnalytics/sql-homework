
--Data - tartibga solingan yoki tartibsiz shaklida saqlanadigan malumotlar

--Database - malumotlarni saqlash, tatiblash , boshqarish, ularga kirishni taminlovchi tizim


--Relational database -  jadval shaklida saqlanadigan va ular orasidagi bog‘liqlik relyatsiyalar orqali aniqlanadigan ma'lumotlar bazasi modeli

--Table – relyatsion ma'lumotlar bazasining asosiy tarkibiy qismi bo‘lib, ustunlar va qatorlar (yoki yozuvlar) dan tashkil topadi. 

--Har bir ustun ma'lum bir ma'lumot turini ifodalaydi.

--Windows Authentication - shaxsiy kompyuteringiz serveridan kirasiz. Bu ancha xavfsizroq.

--SQL Server Authentication - bu maxsus serverlar orqali kiriladi . Bu serverga faqat ruxsat berilgan foydalanuvchilar kiritiladi

create database SchoolDB
create table Students(StudentId int primary key, Student_name varchar(50), age int)
select * from Students

insert into Students  values(1, 'Ali',20)
insert into Students  values(2, 'Ismoil',22)
insert into Students  values(3, 'jahongir',23)
insert into Students  values(4, 'Bek',21)


--SQL - Structured Query Language bu ma'lumotlar bazasini boshqarish uchun mo‘ljallangan standart so‘rov tili. 
--U orqali ma'lumotlarni kiritish, o‘zgartirish, o‘chirish va ularga so‘rovlar yuborish mumkin 

--SQL Server — bu Microsoft tomonidan ishlab chiqilgan relyatsion ma'lumotlar bazasi boshqaruv tizimi (RDBMS).
--U SQL tilidan foydalanib, ma'lumotlarni saqlash, boshqarish va qayta ishlash imkonini beradi


--SSMS - SQL Server Management Studio bu SQL Server bilan ishlash uchun Microsoft tomonidan ishlab chiqilgan grafik interfeysga ega dastur. 
--SSMS yordamida foydalanuvchilar SQL Serverga ulanish, ma'lumotlar bazalarini yaratish, SQL so‘rovlarini yozish va bajarish, ma'lumotlarni boshqarish,
--zaxiralash va tiklash operatsiyalarini amalga oshirishlari mumkin. 
--SSMS faqat SQL Server bilan ishlaydi va boshqa DBMS larni qo‘llab-quvvatlamaydi.

--DQL buyruqlari ma'lumotlarni olish uchun ishlatiladi. Asosiy SELECT operatori shu guruhga kiradi.

SELECT * FROM Students

--DML (Data Manipulation Language – Ma'lumotlarni boshqarish tili)
--DML buyruqlari jadvaldagi ma'lumotlarni qo‘shish, o‘zgartirish yoki o‘chirish uchun ishlatiladi.

--INSERT – yangi yozuv qo‘shish
--UPDATE – mavjud yozuvni o‘zgartirish
--DELETE – yozuvni o‘chirish

INSERT INTO Students VALUES (5, 'Shahzod Murodov', 23);

UPDATE Students  
SET Age = 24  
WHERE StudentID = 4;

DELETE FROM Students  
WHERE StudentID = 4;

select * from Students

--DDL (Data Definition Language – Ma'lumotlar tuzilmasini boshqarish tili)
--DDL buyruqlari jadval yoki boshqa obyektlarni yaratish va ularni boshqarish uchun ishlatiladi.

--Asosiy buyruqlar:
--CREATE – yangi jadval yoki obyekt yaratish
--ALTER – jadval tuzilmasini o‘zgartirish
--DROP – jadval yoki obyektni butunlay o‘chirish
--TRUNCATE – jadvaldagi barcha yozuvlarni o‘chirish

CREATE TABLE Courses (  
    CourseID INT PRIMARY KEY,  
    CourseName VARCHAR(100),  
    Credits INT  
);

ALTER TABLE Students  
ADD Email VARCHAR(100);

DROP TABLE Courses;

TRUNCATE TABLE Students;


--DCL (Data Control Language – Ma'lumotlar xavfsizligini boshqarish tili)
--DCL buyruqlari foydalanuvchilarga ruxsatlarni berish va ularni boshqarish uchun ishlatiladi.

--Asosiy buyruqlar:
--GRANT – foydalanuvchiga huquq berish
--REVOKE – oldin berilgan huquqni bekor qilish

GRANT SELECT ON Students TO 'user1';

REVOKE SELECT ON Students FROM 'user1';

--TCL (Transaction Control Language – Tranzaktsiyalarni boshqarish tili)
--TCL buyruqlari tranzaktsiyalarni boshqarish va ularni saqlash yoki bekor qilish uchun ishlatiladi.

--Asosiy buyruqlar:
--COMMIT – o‘zgarishlarni saqlash
--ROLLBACK – bajarilgan o‘zgarishlarni bekor qilish

BEGIN TRANSACTION;  
UPDATE Students SET Age = 25 WHERE StudentID = 2;

insert into Students values
(6, 'Shabnam', 18),
 (7, 'bekzod', 25),
 (8, 'behruz', 19.)

 select * from Students

 BACKUP DATABASE SchoolDB  
TO DISK = 'C:\Backup\SchoolDB.bak'  
WITH FORMAT, INIT,  
NAME = 'SchoolDB-Full Backup',  
SKIP, NOREWIND, NOUNLOAD, STATS = 10;
