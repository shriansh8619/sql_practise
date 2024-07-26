use db;
select * from customers;
select * from orders;
select c1.first_name,c1.last_name,o1.status,c1.customer_id
from customers c1
join orders o1
on c1.customer_id=o1.customer_id
where o1.status='Cancelled';


select c1.customerNumber,c1.customerName,o1.orderNumber,o1.orderDate,o1.status 
from customers c1
join orders o1
on c1.customerNumber=o1.customerNumber
order by orderDate;

use employees;
select * from salaries;
SELECT 
e.emp_no,
e.first_name,
e.last_name,
round(AVG(s.salary),1) AS averagè
FROM
employees e
JOIN salaries s 
ON e.emp_no=s.emp_no
group by 1;
-- empno,fn,ln,avgsala for only managers
SELECT 
e.emp_no,
e.first_name,
e.last_name,
round(AVG(s.salary),1) AS averagè
FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no
join dept_manager d
ON e.emp_no=d.emp_no
group by 1,2
order by 3 desc limit 5;

-- hw -- fn,ln,birthdate of senior eng working in production dept(d004):
-- fn,ln,salary,of emp who have joined afte 1990 -- employee db


-- left join
use db;
select c1.first_name,o1.order_id,c1.customer_id
from customers c1
left join orders o1
on c1.customer_id=o1.customer_id
order by c1.customer_id; 
select e. first_name,e.last_name,d.dept_no,dp.dept_name from employees e 
left join dept_emp d 
on e.emp_no=d.emp_no
left join departments dp on dp.dept_no=d.dept_no;
-- list all actors,the films they have appeared in,and the film details(sakila)

select country ,city,city_id
from city c 
right join country co 
on c.country_id=co.country_id
where city is not null
order by city;
-- find the films rented by customers,we are intrested in films
-- that have been rented more than 30 times
use sakila;
select * from sakila.film;
select* from sakila.inventory;
select* from rental;
select f.film_id,f.title, count(r.rental_id) as number_of_times_rented from film f
right join inventory i on f.film_id=i.film_id
right join rental r on i.inventory_id=r.inventory_id
group by f.film_id,f.title
having count(r.rental_id)>30;

-- TRY list all actors, the films they have appeared in, and the categories of those films. I
SELECT category.name as category_name, 
film.title AS film_title,
actor.actor_id;

-- full outer join 
-- mysql dosent support full join directly,but you can achieve a similar result using
-- union of left join and right join 
-- Here's an example of combining films with and without rentals:
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * from customers c RIGHT JOIN orders o ON o.customer_id=c.customer_id
union all
SELECT from customers c left JOIN orders o ON o.customer_id=c.customer_id;

-- subqueries (nested queries): more than 1 select statements

-- outer select: select col from tablename where (select) (inner select);

-- inner query executes first and output from inner query is input to the output select comm 
select * from salaries;
select max(salary) from salaries;
# display second highest salary from emp *** *** ** imp -- offset,count 158220, 157821 
select salary from salaries order by salary desc; -- 158220, 157821 
select salary from salaries order by salary desc;
select salary from salaries order by salary desc limit 3,1;