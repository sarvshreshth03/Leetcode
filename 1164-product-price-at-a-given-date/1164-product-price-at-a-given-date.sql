# Write your MySQL query statement below
with pr as (select product_id, new_price,change_date, row_number() over(partition by product_id order by change_date desc) as lst from Products where change_date<='2019-08-16')

select distinct p.product_id, coalesce(pr.new_price,10) as price
from Products p
left join pr on p.product_id=pr.product_id and pr.lst=1;