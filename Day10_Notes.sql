--sub queries and ctes
select avg(sales) from orders --229.85
--average order value
select avg(order_sales) as aov from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) A
--458.61
---find all the orders whose total_sales is greater than aov
select order_id,sum(sales) as order_sales
from orders
group by order_id
having sum(sales)>(select avg(order_sales) as aov from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) A) 
----
select A.*,C.* from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) A
cross join 
(select avg(order_sales) as aov from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) B) C --on 1=1
where order_sales>aov;


select * from employee;
select * from dept;

--give me details of all the employees whose dep is not avaibale in dep table
select *,(select avg(salary) from employee) as avg_salary 
from employee

where dept_id  in (select dep_id from dept)

select emp_id,avg(salary) 
from employee
group by emp_id

select * from employee


select *,(select avg(salary) from employee) as avg_salary 
from employee
where salary > (select avg(salary) from employee)


select e.* , d.dep_avg_sal
from employee e
inner join (select dept_id,avg(salary) as dep_avg_sal 
from employee
group by dept_id) d on e.dept_id=d.dept_id
where e.salary> d.dep_avg_sal

--ctes common table expression
select avg(order_sales) as aov from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) A
;
with A as (select order_id,sum(sales) as order_sales
from orders
group by order_id)
select avg(order_sales) as aov from A;

with 
tov as (select order_id,sum(sales) as order_sales
from orders
group by order_id)
select * from tov
where order_sales > (select avg(order_sales) as aov from tov)

with 
tov as (select order_id,sum(sales) as order_sales
from orders
group by order_id)
,aov_cte as (select avg(order_sales) as aov from tov)
select * from tov
where order_sales > (select aov from aov_cte)



select order_id,sum(sales) as order_sales
from orders
group by order_id
having sum(sales)>(select avg(order_sales) as aov from
(select order_id,sum(sales) as order_sales
from orders
group by order_id) A) 

select e.* , d.dep_avg_sal
from employee e
inner join (select dept_id,avg(salary) as dep_avg_sal 
from employee
group by dept_id) d on e.dept_id=d.dept_id
where e.salary> d.dep_avg_sal

with d as (select dept_id,avg(salary) as dep_avg_sal 
from employee
group by dept_id)
select e.* , d.dep_avg_sal
from employee e
inner join d on e.dept_id=d.dept_id
where e.salary> d.dep_avg_sal
















