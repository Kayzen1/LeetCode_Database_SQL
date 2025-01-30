WITH CTE AS (
    SELECT 
        departmentId, 
        name AS Employee, 
        salary, 
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS sla_rank
    FROM Employee
)
SELECT 
    d.name AS Department, 
    c.Employee, 
    c.salary
FROM CTE AS c
LEFT JOIN Department AS d
ON c.departmentId = d.id
WHERE c.sla_rank = 1;

