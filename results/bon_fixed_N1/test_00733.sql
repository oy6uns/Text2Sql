SELECT DISTINCT d.Document_Object_ID
FROM Document_Objects d
LEFT JOIN Document_Subset_Members dsm ON d.Document_Object_ID = dsm.Document_Object_ID
LEFT JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID
LEFT JOIN Documents_in_Collections dic ON d.Document_Object_ID = dic.Document_Object_ID
LEFT JOIN Collections c ON dic.Collection_ID = c.Collection_ID
WHERE ds.Document_Subset_Name = 'Best for 2000' OR c.Collection_Name = 'Best'
