CREATE DATABASE lab2;

USE lab2;

SELECT * 
FROM country;

-- Query

-- Task 1

SELECT name
FROM country
WHERE region = 'Middle East' and year = 2004
ORDER BY population desc;

-- Task 2

SELECT name, area, gdp
FROM country
WHERE year = 2009 and population > 10000000 and region like '%Europe%';

-- Task 3

SELECT name, region
FROM country
WHERE (area < 5000000 and area > 2000000) and year = 2002
ORDER BY gdp desc;

-- Task 4

SELECT DISTINCT region
FROM country
WHERE name like 'S%';

-- Task 5

INSERT INTO country (name, year, region, area, population, gdp)
VALUES ('SQLvania', 2004, NULL, 4707, 65550, NULL);

SELECT *
FROM country
WHERE name = 'SQLvania';


-- Task 6

SELECT *
FROM country
WHERE area < 10000 and year = 2007;

UPDATE country
SET population = population + 15000
WHERE area < 10000 and year = 2007;

-- Task 7

-- for counting
SELECT COUNT(name) as Rows
FROM country;

-- deleting
DELETE FROM country
WHERE gdp < 0;

-- Task 8

SELECT name, region, population
FROM country
WHERE year = 2010 and population IN (
	SELECT MAX(population)
	FROM country
	WHERE year = 2010
);

-- Task 9

SELECT TOP 3 name, SUM(gdp) AS [Total GDP]
FROM country
WHERE region = 'Asia'
GROUP BY name
ORDER BY [Total GDP] ASC;

-- Task 10

SELECT name, region, SUM(gdp) AS [Total GDP]
FROM country
GROUP BY name, region
HAVING SUM(gdp) > 1.4;