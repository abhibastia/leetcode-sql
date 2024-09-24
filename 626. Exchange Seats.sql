WITH seat_count AS (
    SELECT COUNT(*) AS total_seats FROM Seat
)
SELECT
    CASE
        WHEN s.id % 2 <> 0 AND s.id = sc.total_seats THEN s.id
        WHEN s.id % 2 = 0 THEN s.id - 1
        ELSE s.id + 1
    END AS id,
    s.student
FROM Seat s
CROSS JOIN seat_count sc
ORDER BY id;

