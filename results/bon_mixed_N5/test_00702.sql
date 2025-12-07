SELECT d.Document_Object_ID, COUNT(c.Document_Object_ID) AS children_count
FROM Document_Objects d
LEFT JOIN Document_Objects c ON c.Parent_Document_Object_ID = d.Document_Object_ID
GROUP BY d.Document_Object_ID;
