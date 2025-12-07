SELECT dsm.Document_Object_ID
FROM Document_Subset_Members dsm
JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID
WHERE ds.Document_Subset_Name = 'Best for 2000';
