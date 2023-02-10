use assignment;

select * from orders;

-- 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 

-- Example:  call order_status(2005, 11);

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_order`(in p_year int,in p_month int)
-- BEGIN
-- select ordernumber,orderdate,status 
-- from orders 
-- where year(orderdate)=p_year and month(orderdate)=p_month;
-- END

call assignment.proc_order(2004, 8);
call assignment.proc_order(2005, 5);
call assignment.proc_order(2005, 3);
call assignment.proc_order(2004, 3);

-- 2. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria .
--  [table:Payments]

-- if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
-- if amount > 50000 Platinum



select * from payments;
select * from customers;

select func_pay(144);

select func_pay(110);

-- CREATE DEFINER=`root`@`localhost` FUNCTION `func_pay`(customernumber INT) RETURNS varchar(255) CHARSET utf8mb4
--     DETERMINISTIC
-- BEGIN
--   RETURN (
--     SELECT 
--       CASE 
--         WHEN SUM(amount) < 25000 THEN 'Silver'
--         WHEN SUM(amount) BETWEEN 25000 AND 50000 THEN 'Gold'
--         ELSE 'Platinum'
--       END
--     FROM payments
--     WHERE customernumber = customernumber
--   );
-- END

-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.

select customernumber,customername 
,func_pay(customernumber) as purchase_status
from customers;

-- 3. Replicate the functionality of 'on delete cascade' and 'on update cascade' 
-- using triggers on movies and rentals tables. Note: Both tables - movies and rentals - 
-- don't have primary or foreign keys. Use only triggers to implement the above.

select * from rentals;
select * from movies;

DELIMITER $$
create trigger movies_delete_trigger
before delete ON movies
for each row
begin
  delete from rentals where movieid = OLD.id;
END $$
DELIMITER ;

DELIMITER $$
create trigger movies_update_trigger
after update ON movies
for each row
begin
  update rentals set movieid = NEW.id where movieid = OLD.id;
END $$
DELIMITER ;

show triggers;


#5. Select the first name of the employee who gets the third highest salary. [table: employee]
select * from (select rank() over (order by salary desc) 
as rank_value, empid,fname,lname,deptno, salary from employee)
t1 where rank_value=3;

#6. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1.
select rank() over (order by salary desc) as rank_value, empid,fname,lname,deptno, salary from employee;







