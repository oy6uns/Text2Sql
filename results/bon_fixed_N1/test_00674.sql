SELECT DISTINCT do.Owner
FROM Document_Objects do
JOIN Documents_in_Collections dic ON do.Document_Object_ID = dic.Document_Object_ID
JOIN Collections c ON dic.Collection_ID = c.Collection_ID
WHERE c.Collection_Name = 'Braeden Collection'
