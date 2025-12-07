SELECT DISTINCT c.Collection_Name
FROM Document_Objects d
JOIN Documents_in_Collections dic ON d.Document_Object_ID = dic.Document_Object_ID
JOIN Collections c ON dic.Collection_ID = c.Collection_ID
WHERE d.Owner = 'Ransom'
