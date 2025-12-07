SELECT u.University_Name
FROM university u
JOIN major_ranking mr ON u.University_ID = mr.University_ID
JOIN major m ON mr.Major_ID = m.Major_ID
WHERE m.Major_Name IN ('Accounting', 'Urban Education')
GROUP BY u.University_ID, u.University_Name
HAVING COUNT(DISTINCT m.Major_Name) = 2
