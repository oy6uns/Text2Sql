SELECT DISTINCT ds.Document_Subset_Name
FROM Document_Subsets ds
JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID
JOIN Document_Objects do ON dsm.Document_Object_ID = do.Document_Object_ID
WHERE do.Owner = 'Braeden';
