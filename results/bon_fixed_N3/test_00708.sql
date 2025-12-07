SELECT DISTINCT do.Owner
FROM Document_Objects do
JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID
JOIN Document_Objects related_do ON dsm.Related_Document_Object_ID = related_do.Document_Object_ID
WHERE related_do.Owner = 'Braeden' AND do.Owner <> 'Braeden'
