SELECT DISTINCT d.Description
FROM Document_Objects d
WHERE d.Document_Object_ID IN (
    SELECT DISTINCT Parent_Document_Object_ID
    FROM Document_Objects
    WHERE Parent_Document_Object_ID IS NOT NULL
);
