SELECT COUNT(DISTINCT csm.Related_Collection_ID)
FROM Collections c
JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID
WHERE c.Collection_Name = 'Best';
