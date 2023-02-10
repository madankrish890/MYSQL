create database assignment;

use assignment;

-- 3. Create a table called countries with the following columns
-- a) Insert the following data into the table
create table countries(
name varchar(50) not null,
population int not null,
capital varchar(50) not null);

select * from countries;

insert into countries values('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),
('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');

-- b) Add a couple of countries of your choice

insert into countries values('srilanka',2,'colombo'),('canada',38,'ottawa'),('australia',22,'canberra'),('italy',2,'rome'),('ireland',6,'dublin');

-- c) Change ‘Delhi' to ‘New Delhi'

update countries set capital='New Delhi' where name='India';

select * from countries;

-- 4. Rename the table countries to big_countries .

alter table countries rename to  big_countries;

-- b. Suppliers
-- supplier_id - primary key
-- supplier_name
-- location


CREATE TABLE Suppliers (
supplier_id INT PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(255) NOT NULL UNIQUE,
location VARCHAR(255)
);

select * from suppliers;

-- 5. Create the following tables. Use auto increment wherever applicable
-- a. Product
-- product_id - primary key
-- product_name - cannot be null and only unique values are allowed
-- description
-- supplier_id - foreign key of supplier table


CREATE TABLE Product (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(255) NOT NULL UNIQUE,
description TEXT,
supplier_id INT ,
FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

select * from product;

-- c. Stock
-- id - primary key
-- product_id - foreign key of product table
-- balance_stock

CREATE TABLE Stock (
id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
balance_stock INT,
FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

select * from stock;

desc product;
desc suppliers;
desc stock;

-- 6. Enter some records into the three tables.


insert into suppliers values(100,'gsk','bangalore'),
(101,'terex','chennai'),
(102,'wintac','mumbai'),
(103,'MK_s','delhi'),
(104,'robotricks','bangalore'),
(105,'lk enterprises','kolkatta');

select * from suppliers;

insert into product values(1000,'keyboard','Keyboard, Ideal For: Desktop and Laptop',100),
(1001,'mouse','Mouse, Ideal For: Laptop, Desktop
Lifestyle: Gaming,
Connection Type: Wired','100'),
(1002,'pendrive','128gb',101),
(1003,'usb-cable','Power/Charging | Data Transfer',102),
(1004,'M1 chip','RAM: 8GB, ROM: 512GB SSD
Thunderbolt Port with USB 4
macOS Big Sur',103);

select * from product;

insert into stock(product_id,balance_stock) values(1000,2000),
(1001,3000),
(1002,7500),
(1003,8500),
(1004,4200),
(1003,8200),
(1000,10000);

select * from stock;

-- 7. Modify the supplier table to make supplier name unique and not null.

alter table suppliers modify supplier_name  varchar(255) unique not null;

desc suppliers;

-- 8. Modify the emp table as follows

-- a.	Add a column called deptno

-- b. Set the value of deptno in the following order

-- deptno = 20 where emp_id is divisible by 2
-- deptno = 30 where emp_id is divisible by 3
-- deptno = 40 where emp_id is divisible by 4
-- deptno = 50 where emp_id is divisible by 5
-- deptno = 10 for the remaining records.

select * from employee;

alter table emp add column deptno int;

update emp 
set deptno=case
when emp_no%2=0 then 20
when emp_no%3=0 then 30
when emp_no%4=0 then 40
when emp_no%5=0 then 50
else 10
end;

select * from emp;

-- Create a unique index on the emp_id column.

create unique index emp_id_index on emp(emp_no);

select * from emp_id_index;


-- #10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.

-- emp_no, first_name, last_name, salary

CREATE VIEW emp_sal AS
SELECT emp_no, first_name, last_name, salary
FROM emp
ORDER BY salary DESC;

select * from emp_sal;



  














