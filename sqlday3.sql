use classicmodels;
select * from employees where firstName like '%A%';
select * from employees where firstName like '/%A%';
select * from customers;
select country ,count(customerNumber) as total_customers from customers where country='usa';
select min(amount) as minimum_amount from new_payments;
select max(creditlimit) as max from customers;

-- get me employees with more than 2 prev exp
use db;
select * from employee;
select sum(salary) as total_salary from employee where (PrevExperience >2);
select * from employee where PrevExperience >2;
-- group by
select * from employee;
select PrevExperience,count(EmpName) from employee group by PrevExperience order by salary;
select * from orders;
select PrevExperience,avg(salary) as avg from employee group by PrevExperience order by avg;
select status,count(customer_id) from orders group by status;
use classicmodels;
select jobTitle,count(*) as emp_count from employees group by jobTitle;
-- get the avg salary of only those employees whose exp is > 3

select PrevExperience,avg(salary) as avg from employee where PrevExperience>3 group by PrevExperience order by avg;
-- count the no. of ordersand calculte the togtal sales amnt for each cust who placed orders within a specific date range
select * from new_payments;
select customerNumber,count(*),sum(amount) 
from new_payments 
where paymentDate 
between '2003-06-05' and '2004-12-18' 
group by customerNumber 
order by customerNumber;
-- orders with values greater than 5000 -- use order details table 
select * from orderdetails;
select orderNumber,sum(quantityOrdered * priceEach) as sum 
from orderdetails  
group by orderNumber 
having sum>5000 
order by sum;

select PrevExperience,avg(salary) as avg from employee group by PrevExperience order by avg;
select orderNumber, sum (quantityOrdered priceEach) as total from orderdetails group by orderNumber having total > 5000;

-- diff btw where and having
/*select columnname
from tablename
where condition
group by col
having conditions
order by col
*/
select productCode,SUM(quantityOredered * priceEach) as ordervalue from oderdetails 
where productCode like 's18%'
group by productCode
having ordervalue > 5000
order by ordervalue desc;
-- lists the number of customers in each country 
-- only include countries with more than 5 customers

select country,count(customerName) as count group by country;
-- where and having difference:

-- where: used to filter records from the table based on condition 
-- having: filter records from the groups
-- where: row wise implemenatation but having does columnwise opeartions
-- where can be used without group by , having cannot be used 
-- where cannot work with aggregate func whereaes having works with only select
-- date func
select now();
select date(now());
select curdate();
select date.format(curdate(),'%d/%m/%Y');
