SELECT doc.Document_Object_ID
FROM Documents_in_Collections dic
JOIN Collections c ON dic.Collection_ID = c.Collection_ID
JOIN Document_Objects doc ON dic.Document_Object_ID = doc.Document_Object_ID
LEFT JOIN Document_Subset_Members dsm ON doc.Document_Object_ID = dsm.Document_Object_ID
LEFT JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000'
WHERE c.Collection_Name = 'Best' AND ds.Document_Subset_ID IS NULL;
