WITH emp_sal_rank AS(
    SELECT
        *,
        DENSE_RANK() OVER(
            PARTITION BY departmentId
            ORDER BY salary desc
        ) AS sal_rank
    FROM
        Employee
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    emp_sal_rank e
    JOIN Department d ON e.departmentId = d.id
WHERE
    e.sal_rank <= 3