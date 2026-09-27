# Write your MySQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary
from (select name, salary, departmentId, rank() over(partition by departmentId order by salary desc) as emp from employee) e
join department d on e.departmentId = d.Id
where emp=1;