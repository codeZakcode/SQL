use amazon_db
select avg(sales) from orders
/*The above query gives us average of all the sales
But the average order value is not the avg(sales)
as the same order_id has been ordering multiple products.

To get average order value we have to get sum(sales) of all the order_ids and then 
we have to find avg of the sum of the sales
*/

select avg(order_sales) from
(select order_id,sum(sales) as order_sales from orders
group by order_id) A

-- all the order_ids greater than aov

select order_id, sum(sales)as total_sales from orders
group by order_id
having sum(sales) > (select avg(order_sales) from
(select order_id,sum(sales) as order_sales from orders
group by order_id) A)

--if you want to see the aov beside sum of sales

select order_id,sum(sales) as total_sales, 
(select avg(total_sales) from 
(select order_id,sum(sales) as total_sales from orders
 group by order_id) A) as aov from orders
group by order_id
having sum(sales) >(select avg(total_sales) from 
(select order_id,sum(sales) as total_sales from orders
 group by order_id) A)

--solving the same question using joins

select A.*,C.* from (
select order_id,sum(sales) as total_sales from orders
group by order_id) A
cross join 
(select avg(total_sales) as aov from 
(select order_id,sum(sales) as total_sales from orders
group by order_id) B) C
where total_sales > aov;

--sub query in where  clause
select * from employee
where dept_id in 
(select dep_id from dept);

--sub query as a column
select *,(select avg(salary) from employee)
 from employee;

select e.*,d.dep_salary from employee e 
inner join
(select dept_id, avg(salary) as dep_salary from employee
group by dept_id) d on e.dept_id=d.dept_id;
