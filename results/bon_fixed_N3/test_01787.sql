SELECT DISTINCT u1.University_Name
FROM university u1
JOIN major_ranking mr1 ON u1.University_ID = mr1.University_ID
JOIN major m1 ON mr1.Major_ID = m1.Major_ID
JOIN major_ranking mr2 ON u1.University_ID = mr2.University_ID
JOIN major m2 ON mr2.Major_ID = m2.Major_ID
WHERE m1.Major_Name = 'Accounting' AND m2.Major_Name = 'Urban Education'
