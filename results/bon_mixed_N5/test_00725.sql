SELECT DIC.Document_Object_ID
FROM Documents_in_Collections DIC
JOIN Collections C ON DIC.Collection_ID = C.Collection_ID
WHERE C.Collection_Name = 'Best';
