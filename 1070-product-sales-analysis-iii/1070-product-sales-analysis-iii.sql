# Write your MySQL query statement below
with rnk as (select  *, row_number() over(partition by product_id order by year) as prank from Sales)

select s.product_id, s.year as first_year, s.quantity, s.price
from Sales s
join rnk r on s.product_id=r.product_id and s.year=r.year
where prank=1;