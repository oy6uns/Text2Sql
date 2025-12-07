SELECT DISTINCT d.Parent_Document_Object_ID, p.Description
FROM Document_Objects d
JOIN Document_Objects p ON d.Parent_Document_Object_ID = p.Document_Object_ID
WHERE d.Parent_Document_Object_ID IS NOT NULL;
