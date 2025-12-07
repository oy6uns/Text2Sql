SELECT Document_Object_ID, COUNT(*) AS Number_of_Children
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Parent_Document_Object_ID
ORDER BY Number_of_Children DESC
LIMIT 1;
