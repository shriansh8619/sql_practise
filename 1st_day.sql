/*Data base is a collection of data in a format,that can be easily accessed.
software which is used to manage the db is called DBMS
MYSQL is a very popular open-source  relational database managemnet system(RDBMS)
MYSQL is a relational database management system 
Mysql is Free
types of sql command
DDL (Data Defination Language):create,drop,truncate,alter,rename(artcd)
DML (data manupalation language):insert,update,alter,rename(idu)
DCL ((Data conrol lang):grant and revoke premission
TCL(Transacrion control lang)
DQL(DAta query LAnguange): select */
create database db1;#CREATE DATABASE dbname;
use db1;-- use db_name;
create database if not exists db1;#create database only if does not exists
show databases;
drop database db1;#drop database databasename;
drop database if exists db1;
-- create table tablename(colname,columndatatype,constraint)
create database db;
use db;
create table tb1 (id int,emp_name varchar(30),age int not null);
insert into tb1(id,emp_name,age) values(111,"emp1",34),(112,"emp2",24),(113,"emp3",25);
select	* from tb1;
-- drop table tb1;
CREATE TABLE Persons (
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255));

insert into persons values (1, 'Smith','John','123 Main St','Springfield'),
(2, 'Doe', 'Jane', '456 Oak St', 'Greenfield'),
(3, 'Brown', 'Charlie', '789 Pine St','Mapleton');
select * from persons;
select LastName,FirstName from persons;


#foreign key  and primary key
use db ;
create table personal_info(cust_id int not null,name varchar(20) NOt null ,country varchar(20) not null, city varchar(20),primary key(cust_id));
select * from personal_info;
create table order_info(order_id int primary key ,ord_num int not null,cust_id int,foreign key(cust_id) references personal_info(cust_id));
create table tbl6(rollno int primary key,name varchar(20),age int default 25);
insert into tbl6(rollno,name) values(1,"a"),(2,"b");
select * from tbl6;
create table stu2(id int primary key,city varchar(40),age int,constraint cs2 check (age>18 and city ="pune"));
insert into stu2 values (1,"pune",12);
select * from stu2;
create table tbl3(rollno int primary key,name varchar(20),age int not null);

create table tbl5(rollno int primary key,name varchar(20),age int unique); #unique value
use classicmodels;
show tables;
-- alter thre table 
# alter table : it is used to add,delete,modify columns in sn existing table
alter table employees change employeenumber  emp_no int;
select * from employees;
-- alter table table_name ADD column_name datatype; #add new col
alter table paymen employees customersts
add empname varchar(20);
