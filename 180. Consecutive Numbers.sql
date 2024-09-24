WITH lag_lead AS(
    SELECT
        num,
        lag(num, 1, 0) OVER() AS prev,
        lead(num, 1, 0) OVER() AS next
    FROM
        Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    lag_lead
WHERE
    (num = prev)
    and (num = next)