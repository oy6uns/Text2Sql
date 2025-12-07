SELECT m.Major_Name, mr.Rank
FROM major_ranking mr
JOIN major m ON mr.Major_ID = m.Major_ID
JOIN university u ON mr.University_ID = u.University_ID
WHERE u.University_Name = 'Augustana College';
