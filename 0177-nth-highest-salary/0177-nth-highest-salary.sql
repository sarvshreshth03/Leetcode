CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      select salary
      from (select distinct salary, dense_rank() over(order by salary desc) as sal from employee) as temp
      where sal = N
  );
END