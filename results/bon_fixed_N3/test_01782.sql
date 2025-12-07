SELECT u.University_Name, u.City, u.State
FROM university u
JOIN major_ranking mr ON u.University_ID = mr.University_ID
JOIN major m ON mr.Major_ID = m.Major_ID
WHERE mr.Rank = 1 AND m.Major_Name = 'Accounting';
