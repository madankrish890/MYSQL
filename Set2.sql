use assignment;

select * from employee;

-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]

select * from employee where deptno=10 and salary>3000;

-- 2. The grading of students based on the marks they have obtained is done as follows:

-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions

select * from students;
alter table students drop column Grade ;
alter table students add column Grade varchar(50);

update students
set Grade=case
when marks between 40 and 50 then 'Second Class'
when marks between 51 and 60 then 'First class'
when marks between 61 and 80 then 'First class with distinction'
when marks between 81 and 100 then 'Distinction'
else 'fail'
end;

select * from students;

-- a. How many students have graduated with first class?
select * from students where grade='First class';

select count(*) from students where grade='First class';

-- b. How many students have obtained distinction? [table: students]

select * from students where grade='Distinction';

select count(*) from students where grade='Distinction';

-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]

select * from station;

select distinct city from station where mod(id,2)=0;

-- 4].Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. 
-- In other words, if N is the number of city entries in station,
--  and N1 is the number of distinct city names in station, 
--  write a query to find the value of N-N1 from station.

select count(city)-count(distinct city) as diff from station;

-- 5. Answer the following
-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. 
--    [Hint: Use RIGHT() / LEFT() methods ]

select distinct city from station
where left(city,1) in ('a','e','i','o','u');

select count(distinct city) from station
where left(city,1) in ('a','e','i','o','u');

-- There are 62 cities which starts with ('a','e','i','o','u')


-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
--    Your result cannot contain duplicates.

select distinct city from station
where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u');

select count(distinct city) from station
where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u');

-- There are 26 cities which starts and ends with ('a','e','i','o','u')


-- c. Query the list of CITY names from STATION that do not start with vowels. 
--    Your result cannot contain duplicates.

select distinct city from station
where left(city,1) not in ('a','e','i','o','u');

select count(distinct city) from station
where left(city,1) not in ('a','e','i','o','u');

-- There are 409 cities which starts with ('a','e','i','o','u')

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
--    Your result cannot contain duplicates. [table: station]

select distinct city from station
where left(city,1) not in ('a','e','i','o','u') and right(city,1) not in ('a','e','i','o','u');

select count(distinct city) from station
where left(city,1) not in ('a','e','i','o','u') and right(city,1) not in ('a','e','i','o','u');

-- There are 62 cities which do not  starts and ends with ('a','e','i','o','u')

select count(distinct city) from station;

-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. 
-- Sort your result by descending order of salary. [table: emp]


-- 7. How much money does the company spend every month on salaries for each department? [table: employee]

-- Expected Result
-- ----------------------
-- +--------+--------------+
-- | deptno | total_salary |
-- +--------+--------------+
-- |     10 |     20700.00 |
-- |     20 |     12300.00 |
-- |     30 |      1675.00 |

select * from employee;

select deptno,sum(salary) from employee group by deptno;

-- 8. How many cities in the CITY table have a Population larger than 100000. [table: city]

select * from city;

select district from city where population>100000;

-- 9. What is the total population of California? [table: city]

select sum(population) from city where district='california';

-- 10. What is the average population of the districts in each country? [table: city]

select district,avg(population) from city group by district;

-- 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]

select * from orders;
desc orders;
select * from customers;
desc customers;

select orders.customernumber,orders.status,customers.customernumber,customers.customername,orders.comments
from orders
join customers on orders.customernumber=customers.customernumber
WHERE orders.status = 'Disputed';











