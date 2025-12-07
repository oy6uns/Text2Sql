SELECT Parent_Document_Object_ID AS Document_ID
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Parent_Document_Object_ID
HAVING COUNT(Document_Object_ID) > 1;
