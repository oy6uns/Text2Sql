SELECT u.University_Name
FROM university u
JOIN (
    SELECT University_ID, COUNT(*) AS num_rank1_majors
    FROM major_ranking
    WHERE Rank = 1
    GROUP BY University_ID
    ORDER BY num_rank1_majors DESC
    LIMIT 1
) AS ranked ON u.University_ID = ranked.University_ID
