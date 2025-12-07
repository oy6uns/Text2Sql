SELECT Parent_Document_Object_ID AS Document_Object_ID, COUNT(*) AS Child_Count
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Parent_Document_Object_ID;
