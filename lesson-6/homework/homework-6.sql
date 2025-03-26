-- 1. TestMultipleZero jadvalini yaratish
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

-- 2. TestMultipleZero jadvaliga ma'lumot kiritish
INSERT INTO TestMultipleZero (A, B, C, D) VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

-- 3. Barcha ustunlari 0 bo‘lgan qatorni chiqarib tashlash
SELECT * 
FROM TestMultipleZero 
WHERE A <> 0 OR B <> 0 OR C <> 0 OR D <> 0;

-- 4. InputTbl jadvalini yaratish
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);

-- 5. InputTbl jadvaliga ma'lumot kiritish
INSERT INTO InputTbl (col1, col2) VALUES 
    ('a', 'b'),
    ('a', 'b'),
    ('b', 'a'),
    ('c', 'd'),
    ('c', 'd'),
    ('m', 'n'),
    ('n', 'm');

-- 6. section1 jadvalini yaratish
CREATE TABLE section1 (
    id INT,
    name VARCHAR(20)
);

-- 7. section1 jadvaliga ma'lumot kiritish
INSERT INTO section1 (id, name) VALUES 
    (1, 'Been'),
    (2, 'Roma'),
    (3, 'Steven'),
    (4, 'Paulo'),
    (5, 'Genryh'),
    (6, 'Bruno'),
    (7, 'Fred'),
    (8, 'Andro');

-- 8. section1 jadvalidan IDsi toq bo‘lganlarni topish
SELECT * 
FROM section1 
WHERE id % 2 = 1;

-- 9. section1 jadvalidan eng kichik IDga ega bo‘lgan shaxs
SELECT * 
FROM section1 
ORDER BY id ASC 
LIMIT 1;

-- 10. section1 jadvalidan eng katta IDga ega bo‘lgan shaxs
SELECT * 
FROM section1 
ORDER BY id DESC 
LIMIT 1;

-- 11. section1 jadvalidan ismi 'B' harfi bilan boshlanadiganlarni topish
SELECT * 
FROM section1 
WHERE name LIKE 'B%';

-- 12. ProductCodes jadvalini yaratish
CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

-- 13. ProductCodes jadvaliga ma'lumot kiritish
INSERT INTO ProductCodes (Code) VALUES
    ('X-123'),
    ('X_456'),
    ('X#789'),
    ('X-001'),
    ('X%202'),
    ('X_ABC'),
    ('X#DEF'),
    ('X-999');

-- 14. ProductCodes jadvalidan "_" belgisi mavjud bo‘lgan kodlarni topish
SELECT * 
FROM ProductCodes 
WHERE Code LIKE '%\_%' ESCAPE '\';
