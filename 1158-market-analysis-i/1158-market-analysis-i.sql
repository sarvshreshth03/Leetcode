# Write your MySQL query statement below
with a as (select buyer_id, sum(case when year(order_date)='2019' then 1 else 0 end) as orderss from orders group by buyer_id)

select u.user_id as buyer_id, u.join_date, coalesce(a.orderss,0) as orders_in_2019
from users u
left join a on u.user_id=a.buyer_id
group by u.user_id, u.join_date;