SELECT * FROM City;

SELECT Name, Population FROM City; 

SELECT Name AS 'City',  Population FROM City;

SELECT * FROM CountryLanguage
ORDER BY CountryCode;

SELECT CountryCode AS Country, Population FROM City
ORDER BY Population; 

SELECT Name, CountryCode FROM City
WHERE CountryCode = 'NLD';

SELECT Name AS 'Country', CountryCode AS 'Netherlands' FROM City
WHERE CountryCode = 'NLD'
ORDER BY Country
Limit 4 OFFSET 8;

SELECT Percentage, Language FROM CountryLanguage;

SELECT Count(*) FROM CountryLanguage; 

SELECT Count(*) FROM CountryLanguage
WHERE Percentage > 9 AND CountryCode = 'ABW';

SELECT * FROM item;
SELECT * FROM customer;

INSERT INTO customer(name, address, city, state, zip)
VALUES ('Fred Flinstone', '23 Cobblestone Way', 'Bedrock', 'CA', '91234');

SELECT * FROM customer;

INSERT INTO item (id, name, description)
VALUES (7, 'Choclate', 'Life is like a box of Choclate');

SELECT * FROM item;

INSERT INTO item (id, description)
VALUES (8, 'This is only a test of test');

SELECT * FROM item;

SELECT * FROM sale;

UPDATE sale SET quantity = 6 , price = 5990
WHERE id = 1;

SELECT * FROM sale;

UPDATE sale SET date = NULL, quantity = NULL, price = NULL
WHERE id = 1;

SELECT * FROM sale;

SELECT * FROM item;

DELETE FROM item
WHERE id = 1;

SELECT * FROM item;

CREATE TABLE myTable (
    variable1 text,
    variable2 text
);

SELECT * FROM myTable;

INSERT INTO myTABLE(variable1, variable2)
VALUES ('Hello World', 'Hello SQL');

SELECT * FROM myTable;

DROP TABLE IF EXISTS myTable;

SELECT * FROM myTable;

DROP TABLE myTABLE;
DROP TABLE IF EXISTS myTable;

CREATE TABLE myTable2(
        a INTEGER,
        b INTEGER,
        c INTEGER,  
        d INTEGER, 
        e INTEGER,
        f INTEGER                             
);

INSERT INTO myTable2 
VALUES (1,2, 3, 4, 5, 6);

SELECT * FROM myTable2;

INSERT INTO myTable2 DEFAULT VALUES;

INSERT INTO myTable2 SELECT * FROM sale;

SELECT * FROM myTable2;
SELECT * FROM sale;

SELECT * FROM sale;
DELETE FROM sale
WHERE item_id = 1;

SELECT * FROM customer;
INSERT INTO customer (name, address, city)
VALUES (0, NULL, " ");
SELECT * FROM customer;

SELECT * FROM customer
WHERE address is NULL;

SELECT * FROM customer
WHERE address is NOT NULL;

CREATE TABLE myTable3 (
            column_1 INTEGER NOT NULL, 
            column_2 TEXT NOT NULL
);
SELECT * FROM myTable3;

INSERT INTO myTable3 (column_1) VALUES(26);

CREATE TABLE myTable1(
    column_1 TEXT,
    column_2 TEXT, 
    column_3 INTEGER NOT NULL
);

INSERT INTO myTable1 (column_1, column_2)
VALUES ('SQL', 'SQL2');

CREATE TABLE myTABLE6 (
    column_1 TEXT,
    column_2 INTEGER
);

INSERT INTO myTABLE6 DEFAULT VALUES;
SELECT * FROM myTABLE6;

CREATE TABLE myTable7 (
    c_1 INTEGER,
    c_2 TEXT,
    c_3 TEXT DEFAULT 'Car'
);

INSERT INTO myTable7(c_1, c_2) VALUES (9, 'bicycle');
SELECT * FROM myTable7;

CREATE TABLE myTable8 (
    c_1 INTEGER UNIQUE,
    c_3 TEXT DEFAULT 'mobile'
);

INSERT INTO myTable8(c_1) VALUES (8);
SELECT * FROM myTable8;
INSERT INTO myTable8(c_1) VALUES (9);
SELECT * FROM myTable8;

CREATE Table myTable10 (c1 INT DEFAULT 9, c2 INT DEFAULT 10);
INSERT INTO myTable10 DEFAULT VALUES;
SELECT * FROM myTable10;
ALTER Table myTABLE10 ADD c3 TEXT DEFAULT 'CP';
SELECT * FROM myTable10;

CREATE TABLE myTable11 (
    ID INTEGER PRIMARY KEY,
    c1 INTEGER,
    c2 INTEGER
);

DROP TABLE myTABLE11;
INSERT INTO myTable11 (c1, c2)  VALUES(123, 321);
INSERT INTO myTable11 (c1, c2)  VALUES(125, 321);
INSERT INTO myTable11 (c1, c2)  VALUES(129, 321);
SELECT * FROM myTable11;


DROP TABLE test;

CREATE TABLE test (
ID INTEGER PRIMARY KEY,
a INTEGER,
b TEXT
);

INSERT INTO test (a, b) VALUES ( 10, 'a' );
INSERT INTO test (a, b) VALUES ( 11, 'b' );
INSERT INTO test (a, b) VALUES ( 12, 'c' );

SELECT * FROM test;

SELECT title, duration FROM track
WHERE duration > 300 
ORDER BY duration DESC;

SELECT title, duration FROM track
WHERE duration > 300 OR duration < 200
ORDER BY duration ASC;

SELECT title, track_number, duration FROM track
WHERE duration > 300 AND track_number = 1
ORDER BY duration ASC;

SELECT * FROM track;
SELECT title, track_number, duration FROM track
WHERE duration > 300 AND track_number = 1
ORDER BY duration ASC;

SELECT title, track_number, duration FROM track
WHERE title LIKE '%blue%'
ORDER BY duration ASC;

SELECT title, track_number FROM track
WHERE track_number in (1, 2, 3);

SELECT count(duration) FROM track;
SELECT count(DISTINCT duration) FROM track;

SELECT title FROM track
ORDER BY title DESC;

SELECT album_id, duration FROM track
ORDER BY album_id ASC, duration DESC;

SELECT * FROM country;

SELECT Name, Population, 
CASE
    WHEN Population > 1000000
    THEN 'Large City'
    WHEN Population <1000000
    THEN 'Small City'
END AS "TEST"
FROM Country;

CREATE TABLE left ( id INTEGER, description TEXT );
CREATE TABLE right ( id INTEGER, description TEXT );

INSERT INTO left VALUES ( 1, 'left 01' );
INSERT INTO left VALUES ( 2, 'left 02' );
INSERT INTO left VALUES ( 3, 'left 03' );
INSERT INTO left VALUES ( 4, 'left 04' );
INSERT INTO left VALUES ( 5, 'left 05' );
INSERT INTO left VALUES ( 6, 'left 06' );
INSERT INTO left VALUES ( 7, 'left 07' );
INSERT INTO left VALUES ( 8, 'left 08' );
INSERT INTO left VALUES ( 9, 'left 09' );

INSERT INTO right VALUES ( 6, 'right 06' );
INSERT INTO right VALUES ( 7, 'right 07' );
INSERT INTO right VALUES ( 8, 'right 08' );
INSERT INTO right VALUES ( 9, 'right 09' );
INSERT INTO right VALUES ( 10, 'right 10' );
INSERT INTO right VALUES ( 11, 'right 11' );
INSERT INTO right VALUES ( 11, 'right 12' );
INSERT INTO right VALUES ( 11, 'right 13' );
INSERT INTO right VALUES ( 11, 'right 14' );

SELECT * FROM left;
SELECT * FROM right;

SELECT l.id, l.description  
FROM left AS"l" INNER JOIN right AS "r"
ON l.id = r.id;

SELECT l.id, l.description,r.id,  r.description
FROM left AS "l" LEFT JOIN right AS "r"
ON l.id = r.id;

SELECT left.description, right.description
FROM left 
LEFT OUTER JOIN right ON left.id = right.id;

SELECT * FROM sale;
SELECT * FROM item;

SELECT item.name, sale.price FROM sale INNER JOIN ITEM
ON sale.item_id = item.id;

SELECT * FROM album;
SELECT * FROM track;

SELECT album.id, album.title, track.title
FROM album
INNER JOIN track ON track.album_id = album.id;


SELECT customer.name, customer.zip, item.name, item.description, sale.quantity, sale.price
FROM sale 
JOIN item ON sale.item_id = item.id
JOIN customer ON sale.customer_id = customer.id
ORDER BY customer.name, item.name;

SELECT * FROM Country;
SELECT * FROM City;
SELECT City.Name,Country.name, CountryLanguage.Language, CountryLanguage.CountryCode
FROM City INNER JOIN CountryLanguage ON City.CountryCode = CountryLanguage.CountryCode
INNER JOIN Country ON City.CountryCode = Country.Code
ORDER BY Country.Name, city.Name;


SELECT city.name as city, country.name as country, countrylanguage.Language, country.code
FROM country
JOIN city ON city.countrycode = country.code
JOIN countryLanguage ON countryLanguage.countrycode = country.code
ORDER BY country.name, city.name
;

SELECT 'Here''s to SQL';

SELECT * FROM album;
SELECT title, length(title) "length" FROM track
ORDER BY "length";

SELECT SUBSTR('this is a string', 11); --returns everything from the 11th character onwards


SELECT released,  

SUBSTR(released, 1, 4 ) AS year,
SUBSTR(released, 6, 2) AS Month,
SUBSTR(released, 9, 2) AS Day


FROM album ORDER BY released;

SELECT LifeExpectancy, SUBSTR(LifeExpectancy, 1, 2) AS rounded FROM country;
 
SELECT TRIM('.$.string.t.', '.$t');

SELECT title FROM album;
SELECT UPPER(title) UPPERCASE FROM album;

SELECT  'panda' + 'koala';

SELECT 1/2; 

SELECT 17 / 5;

CREATE TABLE myTable12 (
    c1 VARCHAR(5),
    c2 INT
);

INSERT INTO myTable12 (c1, c2) VALUES (123, 'haha');

SELECT * FROM myTable12;

SELECT DATETIME('now', '+11 hours');
SELECT DATE('now');
SELECT TIME('now', '+11 hours');

SELECT DATETIME('now', '+8 hours');


SELECT COUNT(track_number) FROM track
GROUP BY track_number
ORDER BY COUNT(track_number), DESC;

SELECT * FROM Country;

SELECT Name, COUNT(Region) FROM COUNTRY
GROUP BY Region
HAVING COUNT(region) > 11
ORDER BY COUNT(region) DESC;


SELECT Region, COUNT(region) FROM Country
GROUP BY region
HAVING COUNT(region) > 11
ORDER BY COUNT(region) DESC;

SELECT AVG(duration) FROM track;

SELECT COUNT(DISTINCT duration) FROM track;
