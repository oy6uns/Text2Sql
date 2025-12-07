SELECT dic.Document_Object_ID
FROM Documents_in_Collections dic
JOIN Collections c ON dic.Collection_ID = c.Collection_ID
WHERE c.Collection_Name = 'Best';
