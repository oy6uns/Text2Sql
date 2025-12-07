SELECT University_Name
FROM university
WHERE University_ID NOT IN (
    SELECT University_ID
    FROM major_ranking
    WHERE Rank = 1
);
