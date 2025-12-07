SELECT c.Collection_Name
FROM Collections c
JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
JOIN Document_Objects d ON dic.Document_Object_ID = d.Document_Object_ID
WHERE d.Owner = 'Ransom'
