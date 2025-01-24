"Solution 1"
SELECT project_id
FROM Project
GROUP BY project_id
HAVING
    COUNT(project_id) >= all(
        SELECT COUNT(project_id)
        FROM Project
        GROUP BY project_id
    );

"Solution 2"
WITH
    T AS (
        SELECT
            project_id,
            RANK() OVER (ORDER BY COUNT(employee_id) DESC) AS rk
        FROM Project
        GROUP BY 1
    )
SELECT project_id
FROM T
WHERE rk = 1;