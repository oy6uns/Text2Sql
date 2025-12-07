SELECT u.University_Name
FROM university u
JOIN (
    SELECT University_ID, COUNT(*) AS major_count
    FROM major_ranking
    WHERE Rank = 1
    GROUP BY University_ID
) mr ON u.University_ID = mr.University_ID
ORDER BY mr.major_count DESC
LIMIT 1;
