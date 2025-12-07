SELECT COUNT(DISTINCT csm.Related_Collection_ID) 
FROM Collection_Subset_Members csm
JOIN Collections c ON c.Collection_ID = csm.Collection_ID
WHERE c.Collection_Name = 'Best';
