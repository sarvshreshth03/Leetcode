# Write your MySQL query statement below
with temp as (select num,lag(num) over(order by id) as pnum, lead(num) over(order by id) as nnum from Logs)

select distinct num as ConsecutiveNums
from temp
where num=pnum and num=nnum;