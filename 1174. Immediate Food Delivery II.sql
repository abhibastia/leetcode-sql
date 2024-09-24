-- MySQL 
-- Using Simple subquery and aggregation
SELECT
    ROUND(
        AVG(order_date = customer_pref_delivery_date) * 100,
        2
    ) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date) IN (
        SELECT
            customer_id,
            MIN(order_date)
        FROM
            Delivery
        GROUP BY
            customer_id
    ) -- Using Window function and CTE
    WITH first_orders AS(
        SELECT
            delivery_id,
            customer_id,
            order_date,
            customer_pref_delivery_date
        FROM
            (
                SELECT
                    *,
                    ROW_NUMBER() OVER (
                        PARTITION BY customer_id
                        ORDER BY
                            order_date
                    ) AS row_num
                FROM
                    Delivery
            ) AS rank_delivery
        WHERE
            row_num = 1
    )
SELECT
    ROUND(
        (
            SUM(
                CASE
                    WHEN order_date = customer_pref_delivery_date THEN 1
                    ELSE 0
                END
            )
        ) / COUNT(*),
        2
    ) * 100 AS immediate_percentage
FROM
    first_orders
