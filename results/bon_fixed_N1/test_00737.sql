SELECT COUNT(DISTINCT csm.Collection_ID) 
FROM Collection_Subset_Members csm
JOIN Collections c ON csm.Related_Collection_ID = c.Collection_ID
WHERE c.Collection_Name = 'Best'
