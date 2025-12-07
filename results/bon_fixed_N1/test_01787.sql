SELECT u.University_Name
FROM university u
JOIN major_ranking mr1 ON u.University_ID = mr1.University_ID
JOIN major m1 ON mr1.Major_ID = m1.Major_ID AND m1.Major_Name = 'Accounting'
JOIN major_ranking mr2 ON u.University_ID = mr2.University_ID
JOIN major m2 ON mr2.Major_ID = m2.Major_ID AND m2.Major_Name = 'Urban Education'
GROUP BY u.University_Name;
