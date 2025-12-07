SELECT DISTINCT po.Owner
FROM Document_Objects d
JOIN Document_Objects po ON d.Parent_Document_Object_ID = po.Document_Object_ID
WHERE d.Owner = 'Marlin' AND d.Parent_Document_Object_ID IS NOT NULL;
