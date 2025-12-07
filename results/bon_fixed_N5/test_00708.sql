SELECT DISTINCT d2.Owner
FROM Document_Objects d1
JOIN Document_Subset_Members m ON d1.Document_Object_ID = m.Document_Object_ID
JOIN Document_Objects d2 ON m.Related_Document_Object_ID = d2.Document_Object_ID
WHERE d1.Owner = 'Braeden' AND d2.Owner IS NOT NULL;
