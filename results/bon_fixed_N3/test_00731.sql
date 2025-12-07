SELECT d.Document_Object_ID
FROM Documents_in_Collections d
JOIN Collections c ON d.Collection_ID = c.Collection_ID
WHERE c.Collection_Name = 'Best'
AND d.Document_Object_ID NOT IN (
    SELECT Document_Object_ID
    FROM Document_Subset_Members dm
    JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID
    WHERE ds.Document_Subset_Name = 'Best for 2000'
)
