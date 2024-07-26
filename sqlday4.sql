-- union union all (number of columns should be same),inersect -- try all c , select col
use db;

select customer_id from customers
union all
select order_id from orders;

select customer_id from customers
union 
select order_id from orders;

select customer_id from customers
intersect 
select order_id from orders; # not supported 
select * from customers;
#alternate 
select customer_id from customers where customers.customer_id in (select customer_id from orders);
 use sakila;
 select * from actor;
select first_name,last_name from actor;

select upper(concat(first_name,' ',last_name)) as Actor_name from actor;

select actor_id, first_name, last_name 
from actor where first_name='Joe';

select * from actor where last_name like '%GEN%';

select * from actor where last_name like '%LI%' order by first_name,last_name;

select country_id,country from country where country in('Afghanistan','Bangladesh','China');

alter table actor add middle_name varchar(60) after first_name;

alter table actor modify column last_name blob(60);# correct this 

alter table actor drop column middle_name;

select last_name,count(last_name) from actor group by last_name;

set sql_safe_updates=0;
update actor set first_name = 'harpo' 
where(first_name='groucho'and last_name='williams');


-- join: allows to combine data from 2 or more tables
-- helps in understanding the relationships
-- fact table(real time data,static in nature )and dimension table(transaction tables ) 
-- INNER JOIN , LEFT JOIN , RIGHT JOIN ,FULL OUTER JOIN ,SELF JOIN
-- alias for tables: usefull when selecting common columns from both tables,
-- redable,easy
-- INNER JOIN: DEFAULT JOIIN,matching values from both the tables
-- syntax for inner join 
select column_name(s) 
from table1
inner join table2
on table1.column_name=table2.column_name;

use classicmodels;

select * from orders;
select * from orderdetails;
-- get me the status for respective products from order/orderdetails
select o.orderNumber,o.status,od.productCode 
from orders o
inner join orderdetails od
on o.orderNumber=od.orderNumber;

-- sakila 
use sakila;
select fa.film_id,ft.title
from film_actor fa
inner join film_text ft 
on fa.film_id = ft.film_id;

select * from film_actor;
select * from film_text;

select ft.film_id,fa.actor_id
from film_actor fa 
join film_text ft
on fa.film_id = ft.film_id
order by film_id;
select * from staff;
select * from address;

select s.first_name,s.last_name,a.address 
from staff s 
inner join address a 
on (s.address_id = a.address_id);

select* from payment;
select s.first_name,s.last_name,sum(p.amount) 
from staff s 
inner join payment p 
on (s.staff_id = p.staff_id)
where month(p.payment_date)=08 and year(p.payment_date) = 2005
group by s.staff_id;

select * from film_actor;
select * from film;
select f.title,count(fa.actor_id) as 'NUMBER of actors' 
from film f 
inner join film_actor fa on (f.film_id=fa.film_id) 
group by f.title order by 'Number of actors' desc;

-- left join 
select * from country;
select * from city;
select co.country,c.city from country co left join city c on c.country_id = co.country_id;
select co.country,c.city from city c left join country co on c.country_id = co.country_id;

create table customers