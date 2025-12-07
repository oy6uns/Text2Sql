SELECT DISTINCT Related_Document_Object_ID
FROM Document_Subset_Members
WHERE Document_Object_ID IN (
    SELECT Document_Object_ID
    FROM Document_Objects
    WHERE Owner = 'Ransom'
)
