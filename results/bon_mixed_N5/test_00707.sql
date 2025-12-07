SELECT DISTINCT d1.Owner
FROM Document_Objects d1
JOIN Document_Subset_Members dsm ON d1.Document_Object_ID = dsm.Document_Object_ID
JOIN Document_Objects d2 ON dsm.Related_Document_Object_ID = d2.Document_Object_ID
WHERE d2.Owner = 'Braeden'
