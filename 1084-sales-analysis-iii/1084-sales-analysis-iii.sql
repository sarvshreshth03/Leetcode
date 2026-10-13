# Write your MySQL query statement below
with sales2 as (select product_id, max(sale_date) as new, min(sale_date)as old from Sales group by product_id)

select distinct p.product_id, p.product_name
from product p
join sales2 s on p.product_id=s.product_id
where s.old>='2019-01-01' and s.new<='2019-03-31';