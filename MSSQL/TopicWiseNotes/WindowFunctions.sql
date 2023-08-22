use amazon_db;
select * from employee

select *, row_number() over(order by salary desc ) as rn 
from employee
/*this will realign the table based on the order by condition
and then  assign the row_number values
*/
select *,rank() over (order by salary desc) as rnk,
dense_rank() over (order by salary desc) as drnk,
row_number() over (order by salary desc) as rn
from employee

-- partition by
select *,rank() over (partition by dept_id order by salary desc) as rnk,
dense_rank() over (partition by dept_id order by salary desc) as drnk,
row_number() over (partition by dept_id order by salary desc) as rn
from employee

/*We can use rank,dense_rank and row_number without partition by 
but not by order by in over clause
Window functions can only be used in select */

/*Lead and lag functions*/
select * from employee
/*difference salary of the employee and the immediate next one 
lead (salary,1) salary is column on which we are leading and 1 represent
how many rows to be looked into
we can also add default value for the cases of null 
*/
select *, lead (salary,1) over (order by salary desc ) as next_salary
from employee 

select *, lag (salary,1) over (order by salary desc ) as next_salary
from employee ;

with cte as (select category,year(order_date) as yr,
sum(sales) as total_sales
from orders
group by category,year(order_date))
select *, lead(total_sales,1)over (partition by category order by yr desc)
from cte; 