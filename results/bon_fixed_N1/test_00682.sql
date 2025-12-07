SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL);
