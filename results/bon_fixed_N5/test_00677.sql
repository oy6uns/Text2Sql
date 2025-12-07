SELECT DISTINCT Description 
FROM Document_Objects 
WHERE Document_Object_ID IN (SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
