SELECT Parent_Document_Object_ID AS Document_Object_ID
FROM Document_Objects
WHERE Document_Object_ID IN (
    SELECT Document_Object_ID
    FROM Document_Objects
    WHERE Owner = 'Marlin'
) AND Parent_Document_Object_ID IS NOT NULL;
