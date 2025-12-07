SELECT 
    c.Collection_ID, 
    c.Collection_Name, 
    COUNT(dic.Document_Object_ID) AS Document_Count
FROM 
    Collections c
LEFT JOIN 
    Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
WHERE 
    c.Collection_Name = 'Best'
GROUP BY 
    c.Collection_ID, c.Collection_Name
ORDER BY 
    Document_Count DESC
LIMIT 1;
