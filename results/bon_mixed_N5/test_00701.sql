SELECT Document_Object_ID, COUNT(*) AS child_count
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Parent_Document_Object_ID
ORDER BY child_count DESC
LIMIT 1;
