--database joins--
select o.order_id,r.order_id, r.return_reason
from orders_new o
inner join returns r on o.order_id=r.order_id

select o.order_id,o.sales, r.return_reason
from orders_new as o
left join returns as r on r.order_id=o.order_id

select  r.return_reason,sum(o.sales) as total_sales
from orders_new o
left join returns r on o.order_id=r.order_id
group by r.return_reason


select o.order_id,r.order_id, r.return_reason
from orders_new as o
left join returns as r on r.order_id!=o.order_id

--give me all the orders which were never returned
select e.*,d.dep_id,d.dep_name
from employee e
right join dept d on e.dept_id=d.dep_id

select e.*,d.dep_id,d.dep_name
from employee e
full outer join dept d on e.dept_id=d.dep_id

select top 1 e.*,d.dep_id,d.dep_name
from employee e
inner join dept d on e.dept_id=d.dep_id 
where dep_name = 'IT' 
group by manager_id
having avg(e.salary)>100
order by 
;
select  o.region,count(distinct o.order_id) as total_orders,count(distinct r.order_id) as return_orders  --o.order_id,r.order_id --r.return_reason,sum(o.sales) as total_sales
,count(distinct r.order_id)*1.0/count(distinct o.order_id) as return_ratio
from orders_new o
left join returns r on o.order_id=r.order_id 
group by o.region
order by o.region

select 1*1.0/2


