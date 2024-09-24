-- Using JOIN
SELECT
    e.employee_id
FROM
    Employees e
    LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE
    e.salary < 30000
    AND m.employee_id IS NULL
    AND e.manager_id IS NOT NULL
ORDER BY
    e.employee_id 

-- Using subquery
SELECT
    employee_id
FROM
    Employees
WHERE
    salary < 30000
    AND manager_id NOT IN(
        SELECT
            DISTINCT employee_id
        FROM
            Employees
    )
ORDER BY
    employee_id
