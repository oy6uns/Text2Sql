SELECT Document_Object_ID
FROM Document_Objects
WHERE Document_Object_ID IN (
    SELECT Parent_Document_Object_ID
    FROM Document_Objects
    WHERE Parent_Document_Object_ID IS NOT NULL
    GROUP BY Parent_Document_Object_ID
    HAVING COUNT(*) > 1
);
