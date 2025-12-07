SELECT University_Name
FROM university u
WHERE NOT EXISTS (
    SELECT 1
    FROM major_ranking mr
    WHERE mr.University_ID = u.University_ID
      AND mr.Rank = 1
);
