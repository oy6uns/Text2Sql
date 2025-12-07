SELECT u.University_Name, o.Citation_point
FROM overall_ranking o
JOIN university u ON o.University_ID = u.University_ID
WHERE o.Reputation_point >= (
    SELECT MIN(Reputation_point)
    FROM (
        SELECT DISTINCT Reputation_point
        FROM overall_ranking
        ORDER BY Reputation_point DESC
        LIMIT 3
    )
)
ORDER BY o.Reputation_point DESC;
