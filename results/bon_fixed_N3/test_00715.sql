SELECT Document_Object_ID
FROM Document_Subset_Members
JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID
WHERE Document_Subset_Name = 'Best for 2000';
