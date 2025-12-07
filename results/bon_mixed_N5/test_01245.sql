SELECT medium, COUNT(*) AS work_count
FROM (
    SELECT medium FROM Paintings
    UNION ALL
    SELECT medium FROM Sculptures
) AS all_works
GROUP BY medium
ORDER BY medium;
