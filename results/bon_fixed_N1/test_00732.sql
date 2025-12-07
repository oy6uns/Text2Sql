SELECT DISTINCT d.Document_Object_ID
FROM Documents_in_Collections d
JOIN Collections c ON d.Collection_ID = c.Collection_ID
WHERE c.Collection_Name = 'Best'
AND d.Document_Object_ID NOT IN (
    SELECT Document_Object_ID
    FROM Document_Subset_Members m
    JOIN Document_Subsets s ON m.Document_Subset_ID = s.Document_Subset_ID
    WHERE s.Document_Subset_Name = 'Best for 2000'
)
