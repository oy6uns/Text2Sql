SELECT COUNT(DISTINCT dic.Document_Object_ID)
FROM Collections c
JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
WHERE c.Collection_Name = 'Best';
