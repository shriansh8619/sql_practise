use classicmodels;
describe employees;  # describe table name  and decribe its columns n info
alter table employees add empname varchar(20);  # alter table table name add column name  datatype # adding a new column
describe payments;



alter table payments add DOB date;
alter table payments add salary int after amount;
select * from payments;

alter table payments add column indexn int first;
select * from payments;    #

create table personal_info(cust_id int not null,name varchar(20) not null,country varchar(20) not null,city varchar(20));
alter table personal_info add primary key(cust_id) ;
describe personal_info;
alter table personal_info DROP primary key;
#select * from personal_info;
describe personal_info;


alter table payments drop column empname;
describe payments;

alter table payments modify column DOB year;
describe new_payments;

rename table payments to  new_payments;

select* from customers;
select customerNumber,customerName from customers;
select distinct city from customers;

select count(distinct city) from customers;


select firstname,length(firstname) as length from employees;


select firstName,lastname,concat(firstname," ",lastname) as full_name from employees;
select*from employees;

select count(lastname) as totalemp from employees;
select count(*) as totalemp from employees;


select count(distinct firstname) as unique_firstname from employees;



# DML : insert,update, delete 
-- update : update the existing records in a table use where class
-- delete: deletes the existing records in the table where clause it uses predicates like equal, not equal,less than, etc

select * from employees where firstname = 'mary';
select * from customers;
select city,customerName from customers where city = 'Las Vegas';

select * from customers where country = 'USA' and contactFirstName = 'Jean';


select   customerName from customers where creditLimit > 10000; 
describe customers;
select customerName,country from customers where country in ('USA','France');
select * from customers where country = 'germany' and(city = 'berlin' or city = 'stuttgart');

select customerName,city from customers where city in ('berlin','stuttgart');


select customername,creditlimit as cust_20k30k from customers where creditlimit between 20000 and 30000;

select count(customername)  as cust_20k30k from customers where creditlimit between 20000 and 30000;

select firstname from employees where firstname between 'a' and 'l';

select customername,country from customers where country not in ('USA','FRANCE');



--  the update statement is used to modify the existing records in a table.
--  update table_name
--  set column1 = value1, col2 = value2...
--  where contidition;
use classicmodels;
select * from offices;
update offices set city = 'SF' where officecode = 1;



update customers set customername = 'AG' where customernumber = 103;
select* from classicmodels.customers;


update customers set postalcode = '00001' where country= 'usa';
-- describe customers;
select* from classicmodels.customers;

#delete clause
insert into personal_info values(1,'name1','c1','city1');
delete from personal_info where name = 'name1';
select* from classicmodels.personal_info;

delete from personal_info where cust_id(1,3);
select * from personal_info;
describe personal_info;


-- limit clause:
-- mysql limit clause
-- use to specify the number of records to return offset specifies the number of rows to skip before starting to return the rows.
select * from employees;
select emp_no,firstname from employees limit 4;
select emp_no,firstname from employees limit 2 offset 4;
select emp_no,firstname from employees limit 2,5;

-- select col1,col2 from tablename or by col asc;
select firstname,lastname from employees order by firstname asc; 

select customerNumber,amount from new_payments order by amount desc limit 5; 

-- wildcards :
-- allows us to perform fuzzy matching searches in a database -- like not like % represent zero or more characters
-- _ represents a single characters
-- [] represents any single character within the brackets
-- ^ any character not in the brackets
-- - any sinle char within specified range
-- {} represents any escaped char
use classicmodels;
select * from matches;
select city from matches where city like '%ore';

-- create a new col email id to existing table employee
-- insert some records with not available or blank
-- write query to extract null values from email id col
-- add the primary key to empid col
-- top 10 employees(highest salary)
-- employess with experience greter than 2 years
-- list of emp joined in the year 2019



