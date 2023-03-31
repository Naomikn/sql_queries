--1. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

SELECT name
FROM city
WHERE countrycode = 'USA' AND population > 120000;

--2. Query all columns (attributes) for every row in the CITY table.

SELECT *
FROM city;

--3. Query all columns for a city in CITY with the ID 1661.

SELECT *
FROM city
WHERE id = 1661;

--4. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT *
FROM city
WHERE countrycode = 'JPN';

--5. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT name
FROM city
WHERE countrycode = 'JPN';

--6. Query a list of CITY and STATE from the STATION table.

SELECT city, state
FROM station;

--7. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT city
FROM station
WHERE (ID % 2) = 0;

--8. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(city)- COUNT(DISTINCT city)
FROM station;

--9. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT city, length(city)
FROM station
ORDER BY length(city), city LIMIT 1;

SELECT city, length(city)
FROM station
ORDER BY length(city) DESC, city LIMIT 1;

--10. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE  city  LIKE 'A%' 
or  city  LIKE 'E%' 
or city  LIKE 'I%'
 or city  LIKE 'O%' 
or city  LIKE 'U%';

--11. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE RIGHT(CITY,1) IN  ('a', 'e', 'i', 'o', 'u');

--12. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM   station
WHERE  city RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'

--13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[AEIOU].*';

--14. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT*
FROM city
WHERE countrycode = 'USA' AND population > 100000;

--15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY 
FROM STATION 
WHERE UPPER(SUBSTR(CITY, LENGTH(CITY), 1)) 
NOT IN ('A','E','I','O','U') 
AND LOWER(SUBSTR(CITY, LENGTH(CITY),1)) 
NOT IN ('a','e','i','o','u');    

--16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city
FROM station
WHERE city NOT RLIKE '^[aeiou]'
OR city NOT REGEXP '[aeiou]$';

--17. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name
FROM students 
WHERE marks > 75 
ORDER BY RIGHT(name, 3), ID;


--18. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name 
FROM Employee 
ORDER BY name;

--19. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

SELECT name 
FROM Employee 
WHERE salary > 2000 AND months < 10 
ORDER BY employee_id;

--20. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345 . Truncate your answer to 4 decimal places.

SELECT TRUNCATE(sum(lat_n),4) 
FROM station 
WHERE lat_n BETWEEN 38.7880 AND 137.2345;