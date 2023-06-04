CREATE DATABASE HiltopGroup;
USE hiltopgroup;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

SELECT * FROM hr;

DESCRIBE hr;

SELECT birthdate FROM hr;

set sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT * FROM hr;

SELECT
min(age) AS youngest,
max(age) AS oldest
FROM hr;

SELECT COUNT(*) FROM hr WHERE age > 18;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;

#What is the gender breakdown of employees in the company?
SELECT gender, count(*) AS count
FROM hr
WHERE age >= 18
GROUP BY gender;

#What is the race/ethnicity breakdown in the company?
SELECT race, count(*) AS count
FROM hr
WHERE age >= 18
GROUP BY race
ORDER BY count DESC;

#What is the age distribution of employees in the company?
SELECT min(age) AS youngest, max(age) AS oldest
FROM hr
WHERE age>= 18;

 SELECT FLOOR(age/18)*10 AS age_group, COUNT(*) AS count
 FROM hr
 WHERE age >=18
 GROUP BY FLOOR(age/10)*10;
 
 SELECT
 CASE
 WHEN age >= 18 AND age <= 24 THEN '18-24'
 WHEN age >= 25 AND age <= 34 THEN '25-34'
 WHEN age >= 35 AND age <= 44 THEN '35-44'
 WHEN age >= 45 AND age <= 54 THEN '45-54'
 WHEN age >= 55 AND age <= 64 THEN '55-64'
 ELSE '65+'
 END AS age_group,
 COUNT(*) AS count
 FROM hr
 WHERE age >= 18
 GROUP BY age_group
 ORDER BY age_group;
 
 SELECT
 CASE
 WHEN age >= 18 AND age <= 24 THEN '18-24'
 WHEN age >= 25 AND age <= 34 THEN '25-34'
 WHEN age >= 35 AND age <= 44 THEN '35-44'
 WHEN age >= 45 AND age <= 54 THEN '45-54'
 WHEN age >= 55 AND age <= 64 THEN '55-64'
 ELSE '65+'
 END AS age_group, gender,
 COUNT(*) AS count
 FROM hr
 WHERE age >= 18
 GROUP BY age_group, gender
 ORDER BY age_group, gender;
 
 #How many employees work at headquarters versus remote locations?
 SELECT location, count(*) AS count
 FROM hr
 WHERE age >= 18
 GROUP BY location

#How does the gender distribution vary across departments?
SELECT department, gender, count(*) AS count
FROM hr
WHERE age >= 18
GROUP BY department, gender
ORDER BY department;

#What is the distribution of job titles across the company?
SELECT department, jobtitle, count(*) AS count
FROM hr
WHERE age >= 18
GROUP BY jobtitle
ORDER BY jobtitle DESC;

#What is the dsitribution of employees across locations by state?
SELECT location_state, count(*) AS count
FROM hr
WHERE age >= 18
GROUP BY location_state
ORDER BY count DESC;