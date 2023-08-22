use amazon_db 
select top 1 * from orders 

select * from(
select *,sum(salary) over (partition by dept_id) as sum_sal from employee) A
where sum_sal>38000




