SELECT ds.Document_Subset_Name, dsm.Document_Object_ID
FROM Document_Subsets ds
JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID;
