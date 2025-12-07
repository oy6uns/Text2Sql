SELECT DISTINCT d.Document_Object_ID
FROM Documents_in_Collections d
JOIN Collections c ON d.Collection_ID = c.Collection_ID
LEFT JOIN Document_Subsets ds ON ds.Document_Subset_Name = 'Best for 2000'
LEFT JOIN Document_Subset_Members dsm ON d.Document_Object_ID = dsm.Document_Object_ID AND dsm.Document_Subset_ID = ds.Document_Subset_ID
WHERE c.Collection_Name = 'Best'
  AND dsm.Document_Object_ID IS NULL;
