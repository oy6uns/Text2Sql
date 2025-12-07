SELECT DISTINCT c.Collection_Name
FROM Collections c
JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
JOIN Document_Objects do ON dic.Document_Object_ID = do.Document_Object_ID
WHERE do.Owner = 'Ransom ';
