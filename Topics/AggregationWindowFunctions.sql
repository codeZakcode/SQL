use amazon_db 
select top 1 * from orders 

select * from(
select *,sum(salary) over (partition by dept_id) as sum_sal from employee) A
where sum_sal>38000


--row_number
--dense_rank
--rank
--lead 
--lag 
--first_value and last_value by ankitbansal

select avg(salary) from employee

select *,
(select avg(salary) from employee) as avg_salary
 from employee

select e.*,a.avg_salary from employee e 
cross join (select avg(salary) as avg_salary from employee) a

select *,sum(salary) over () as avg_salary  from employee

select *,sum(salary) 
over(partition by dept_id) as dep_avg_salary 
from employee

select *,sum(salary) 
over(order by salary, emp_id) as cum_sum from employee 

select *,
sum(salary)
 over(partition by dept_id order by salary,emp_id) as cum_sum
from employee ;

select *,
max(salary) over(partition by dept_id ) ,
max(salary) over(partition by dept_id order by salary,emp_id),
max(salary) over(order by salary,emp_id)
from employee 
order by salary,emp_id


select *,
sum(salary)
over( order by salary,emp_id rows between current row  and unbounded following ) 
from employee
order by salary,emp_id 












--advance aggregation
select *,
avg(salary) over (partition by dept_id) as dep_avg_salary
from employee

select *,
sum(salary) over(order by salary ,emp_age) as running_sum
from employee

select *,
sum(salary) over(partition by dept_id order by salary ,emp_age) as running_sum
from employee

--rolling 2 salaries


select *,
sum(salary) over(order by salary ,emp_age rows between 2 preceding and current row) as rolling_3sum
from employee

--following row 
select *,
sum(salary) over(order by salary ,emp_age rows between 1 preceding and 1 following) as rolling_3sum
from employee


--unbounded preceding
--unbounded following 
