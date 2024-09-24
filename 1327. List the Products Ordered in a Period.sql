SELECT
    p.product_name AS product_name,
    SUM(unit) AS unit
FROM
    Orders o
    JOIN Products p ON o.product_id = p.product_id
WHERE
    YEAR(o.order_date) = '2020'
    AND MONTH(o.order_date) = '02'
GROUP BY
    p.product_name
HAVING
    SUM(unit) >= 100