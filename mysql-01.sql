/*
CREATE TABLE book(
    book_id	INT PRIMARY KEY AUTO_INCREMENT,
    title	VARCHAR(50),
    author	VARCHAR(30),
    price	DECIMAL(8, 2),
    amount	INT
);

INSERT INTO book (title, author, price, amount)
	VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3);

INSERT INTO book (title, author, price, amount)
    VALUES
        ("Белая гвардия", "Булгаков М.А.", 540.50, 5),
        ("Идиот", "Достоевский Ф.М.", 460.00,10),
        ("Братья Карамазовы", "Достоевский Ф.М.", 799.01, 2),
        ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);

INSERT INTO book (title, author, price, amount)
    VALUES
        ("", "Иванов С.С.", 50.00, 10),
        ("Дети полуночи", "Рушди Салман", 950.00, 5),
        ("Лирика", "Гумилев Н.С.", 460.00, 10),
        ("Поэмы", "Бехтерев С.С.", 460.00, 10),
        ("Капитанская дочка", "Пушкин А.С.", 520.50, 7);

SELECT author, title, price FROM book;

SELECT title AS "Название книги", author AS Автор FROM book;

SELECT title, amount,
     1.65 * amount AS pack
FROM book;

SELECT author, title,
	IF (author = "Булгаков М.А.", ROUND(price*1.1 ,2),
    	IF (author = "Есенин С.А.", ROUND(price*1.05 ,2),
		   price)
	   ) AS new_price
FROM book;


SELECT author, title, price
FROM book
WHERE amount < 10;


SELECT title, author, price, amount
FROM book
WHERE (price < 500 OR price > 600) AND (price*amount >= 5000);


SELECT title, author
FROM book
WHERE (price BETWEEN 540.50 AND 800) AND amount IN (2,3,5,7);


SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC;


SELECT title, author
FROM book
WHERE (title LIKE "%_ _%") AND (author LIKE "%С.%")
ORDER BY title;
*/
/*
-- Вычислить общую стоимость каждого комплекта книг
-- и отсортировать их по сумме от большей к меньшей
SELECT title, author, price, amount, (price * amount) AS summa
FROM book
ORDER BY summa DESC;
*/
/*
SELECT DISTINCT amount
FROM book;
*/
/*
SELECT author, sum(amount), count(amount)
FROM book
GROUP BY author;
*/
/*
SELECT author AS Автор,
       COUNT(title) AS Различных_книг,
       SUM(amount) AS Количество_экземпляров
FROM book
GROUP BY author;
*/
/*
SELECT
    author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена,
    ROUND(AVG(price),2) AS Средняя_цена
FROM book
GROUP BY author;
*/
/*
SELECT
    author,
    SUM(price * amount) AS Стоимость,
    ROUND(SUM(price * amount) * 0.18 / (1 + 0.18) ,2) AS НДС,
    ROUND(SUM(price * amount) / (1 + 0.18) ,2) AS Стоимость_без_НДС
FROM book
GROUP BY author;
*/
/*
SELECT
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена,
    ROUND(AVG(price) ,2) AS Средняя_цена
FROM book;
*/

SELECT
    author,
    SUM(price * amount) AS Стоимость
FROM book
WHERE title NOT IN ('Идиот', 'Белая гвардия')
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY Стоимость DESC;

select * from book;
