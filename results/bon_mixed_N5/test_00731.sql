SELECT d.Document_Object_ID
FROM Documents_in_Collections d
JOIN Collections c ON d.Collection_ID = c.Collection_ID
LEFT JOIN Document_Subset_Members dsm ON d.Document_Object_ID = dsm.Document_Object_ID
LEFT JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID
WHERE c.Collection_Name = 'Best'
  AND (ds.Document_Subset_Name != 'Best for 2000' OR ds.Document_Subset_Name IS NULL)
