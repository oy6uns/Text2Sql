SELECT Document_Object_ID, COUNT(Parent_Document_Object_ID) AS Children_Count
FROM Document_Objects
GROUP BY Document_Object_ID
ORDER BY Document_Object_ID;
