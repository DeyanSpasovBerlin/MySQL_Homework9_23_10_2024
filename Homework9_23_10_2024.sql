/*
Описание задания.
 1 уровень сложности: 1. Создать таблицу goods с полями:
    - id (уникальное значение)
    - title (cтрока максимум 30 символов)
    - quantity (число больше 0)
    - instock (символ (Y/N))
Заполните созданную таблицу goods данными, минимум 10 строк.
insert into goods (id, title, quantity, instock) values (1, 'Велосипед', 2, 'Y');
insert into goods (id, title, quantity, instock) values (2, 'Скейт', 4, 'Y');
insert into goods (id, title, quantity, instock) values (3, 'Самокат', 2, 'Y');
insert into goods (id, title, quantity, instock) values (4, 'Сноуборд', 7, 'N');
insert into goods (id, title, quantity, instock) values (5, 'Санки', 1, 'Y');
insert into goods (id, title, quantity, instock) values (6, 'Коньки', 3, 'N');
insert into goods (id, title, quantity, instock) values (7, 'Ролики', 5, 'Y');



    Создать таблицу goods_2 с полями:

        id (уникальное значение)

        title (cтрока максимум 30 символов)

        quantity (число больше 0)

        price (целое число)

        in_stock (символ (Y/N))


Заполните созданную таблицу goods2 данными, минимум 10 строк.
insert into goods2 (id, title, quantity, price, instock) values (1, 'Тюбинг', 5, 1000, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (2, 'Санки', 2, 1500, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (3, 'Снегокат', 2, 900, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (4, 'Сноуборд', 7, 700, 'N');
insert into goods2 (id, title, quantity, price, instock) values (5, 'Клюшка', 8, 300, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (6, 'Коньки', 3, 350, 'N');
insert into goods2 (id, title, quantity, price, in_stock) values (7, 'Форма', 9, 450, 'Y');

Задачи:
Вывести все наименования товаров (включая дубли) из двух таблиц
Вывести уникальные названия товаров (без дублей) из двух таблиц
Объединить данные из двух таблиц, указав price, где это возможно

2 уровень сложности: 
*/

CREATE DATABASE Homework_9;
USE Homework_9;
--  1. Создать таблицу goods с полями:
CREATE TABLE goods (
id INTEGER(10) UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(32), 
quantity INTEGER(16) CHECK ( quantity > 0),
price INTEGER(16) CHECK (price > 0),
instock VARCHAR(2) CHECK (instock IN ('Y','N')));
SELECT
*
FROM goods;
-- Заполните созданную таблицу goods данными, минимум 10 строк.
insert into goods (id, title, quantity, instock) values (1, 'Велосипед', 2, 'Y');
insert into goods (id, title, quantity, instock) values (2, 'Скейт', 4, 'Y');
insert into goods (id, title, quantity, instock) values (3, 'Самокат', 2, 'Y');
insert into goods (id, title, quantity, instock) values (4, 'Сноуборд', 7, 'N');
insert into goods (id, title, quantity, instock) values (5, 'Санки', 1, 'Y');
insert into goods (id, title, quantity, instock) values (6, 'Коньки', 3, 'N');
insert into goods (id, title, quantity, instock) values (7, 'Ролики', 5, 'Y');
INSERT INTO goods(id, title, quantity, instock) VALUES
(8,'мячь',10,'Y'),
(9,'гимнастический трамплин',6,'Y'),
(10,'параллельные брусья',9,'Y'),
(11,'перекладина',8,'Y'),
(12,'кольца',11,'Y');
ALTER TABLE goods
DROP COLUMN price;
UPDATE goods
SET instock = 'N'
WHERE id = 10;
-- Создать таблицу goods_2 с полями:
CREATE TABLE goods2 (
id INTEGER(10) UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(32), 
quantity INTEGER(16) CHECK ( quantity > 0),
price INTEGER(16) CHECK (price > 0),
instock VARCHAR(2) CHECK (instock IN ('Y','N')));
SELECT
*
FROM goods2;
-- Заполните созданную таблицу goods2 данными, минимум 10 строк.
insert into goods2 (id, title, quantity, price, instock) values (1, 'Тюбинг', 5, 1000, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (2, 'Санки', 2, 1500, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (3, 'Снегокат', 2, 900, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (4, 'Сноуборд', 7, 700, 'N');
insert into goods2 (id, title, quantity, price, instock) values (5, 'Клюшка', 8, 300, 'Y');
insert into goods2 (id, title, quantity, price, instock) values (6, 'Коньки', 3, 350, 'N');
insert into goods2 (id, title, quantity, price, in_stock) values (7, 'Форма', 9, 450, 'Y');
INSERT INTO goods2(id, title, quantity,price, instock) VALUES
(8,'боксёрские перчатки',10,200,'Y'),
(9,'шипы спринтера',6,150,'N'),
(10,'гандбольные ворота',3,300,'Y'),
(11,'баскетбольное кольцо',8,50,'Y'),
(12,'гантель 32 кг',11,80,'N');

-- Вывести все наименования товаров (включая дубли) из двух таблиц
SELECT concat('goods','-',id) AS combi_id, concat('goods','-',title) AS combi_title from goods AS t1
UNION ALL
SELECT concat('goods2','-',id), concat('goods2','-',title) from goods2 AS t2;

-- Вывести уникальные названия товаров (без дублей) из двух таблиц
SELECT concat('goods','-',id) AS combi_id, concat('goods','-',title) AS combi_title from goods AS t1
UNION 
SELECT concat('goods2','-',id), concat('goods2','-',title) from goods2 AS t2;

-- Объединить данные из двух таблиц, указав price, где это возможно
-- обединение по повторяущееся title
SELECT
-- t1.id,
t1.title,
-- t2.id
t2.price
FROM goods AS t1
INNER JOIN goods2 AS t2
ON t1.title = t2.title;

-- обединение по повторяущееся title, с показывание количества одинаковых товаров в разных складов
SELECT
-- t1.id,
t1.title,
t1.quantity ,
-- t2.id
t2.quantity ,
t2.price
FROM goods AS t1
INNER JOIN goods2 AS t2
ON t1.title = t2.title;

-- обединение по повторяущееся id - показываеть содержание 2 складов рядом один с другим
SELECT
t1.id,
t1.title,
t2.id,
t2.title,
t2.price
FROM goods AS t1
INNER JOIN goods2 AS t2
ON t1.id = t2.id;

-- обединение по title - показываеть содержание 2 складов  один под другим с указанием цены, если она существует
SELECT concat('goods','-',id) AS combi_id, concat('goods','-',title) AS combi_title, 0 AS has_price from goods AS t1
UNION ALL
SELECT concat('goods2','-',id), concat('goods2','-',title), price from goods2 AS t2;


