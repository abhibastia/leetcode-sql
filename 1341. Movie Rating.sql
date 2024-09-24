(
    SELECT
        u.name AS results
    FROM
        MovieRating r
        JOIN Users u ON u.user_id = r.user_id
    GROUP BY
        u.name
    ORDER BY
        COUNT(*) desc,
        u.name
    LIMIT
        1
)
UNION ALL 
(
    SELECT
        m.title AS results
    FROM
        MovieRating r
        JOIN Movies m ON m.movie_id = r.movie_id
    WHERE
        DATE_FORMAT(r.created_at, '%Y-%m') = '2020-02'
    GROUP BY
        m.title
    ORDER BY
        AVG(rating) desc,
        m.title
    LIMIT
        1
)