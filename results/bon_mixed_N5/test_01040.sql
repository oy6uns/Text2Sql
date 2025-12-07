SELECT name
FROM Affiliation
WHERE address LIKE '%China%'
AND affiliation_id IN (
    SELECT affiliation_id
    FROM Author_list
    WHERE affiliation_id IN (
        SELECT affiliation_id
        FROM Affiliation
        WHERE address LIKE '%China%'
    )
    GROUP BY affiliation_id
    HAVING COUNT(DISTINCT paper_id) = (
        SELECT MAX(paper_count)
        FROM (
            SELECT COUNT(DISTINCT paper_id) AS paper_count
            FROM Author_list
            WHERE affiliation_id IN (
                SELECT affiliation_id
                FROM Affiliation
                WHERE address LIKE '%China%'
            )
            GROUP BY affiliation_id
        ) AS counts
    )
)
