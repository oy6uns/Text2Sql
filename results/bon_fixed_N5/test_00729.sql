SELECT dsc.Document_Object_ID
FROM Document_Subset_Members dsc
JOIN Document_Subsets ds ON dsc.Document_Subset_ID = ds.Document_Subset_ID
JOIN Documents_in_Collections dic ON dsc.Document_Object_ID = dic.Document_Object_ID
JOIN Collections c ON dic.Collection_ID = c.Collection_ID
WHERE ds.Document_Subset_Name = 'Best for 2000'
  AND c.Collection_Name = 'Best';
