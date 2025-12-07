SELECT Document_Object_ID, COUNT(*) AS number_of_children
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Parent_Document_Object_ID
ORDER BY number_of_children DESC
LIMIT 1;
