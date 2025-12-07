SELECT u.University_Name
FROM university u
JOIN major_ranking mr ON u.University_ID = mr.University_ID
WHERE mr.Rank = 1
GROUP BY u.University_ID, u.University_Name
ORDER BY COUNT(*) DESC
LIMIT 1;
