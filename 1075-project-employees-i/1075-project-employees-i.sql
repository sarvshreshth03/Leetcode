# Write your MySQL query statement below
SELECT p.PROJECT_ID, round(SUM(e.experience_years)/count(*),2) as average_years
from Project p
join Employee e on p.employee_id=e.employee_id
group by p.PROJECT_ID;