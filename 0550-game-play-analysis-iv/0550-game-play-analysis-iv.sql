# Write your MySQL query statement below
select round(count(distinct a.player_id)/(select count(distinct player_id) from Activity),2) as fraction
from Activity a
where (a.player_id, DATE_SUB(a.event_date, INTERVAL 1 DAY)) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
);