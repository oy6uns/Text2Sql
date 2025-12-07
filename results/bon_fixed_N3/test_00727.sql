SELECT 
    c.Collection_Name, 
    c.Collection_ID, 
    COUNT(d.Document_Object_ID) AS Number_of_Documents
FROM 
    Collections c
JOIN 
    Documents_in_Collections d ON c.Collection_ID = d.Collection_ID
GROUP BY 
    c.Collection_Name, c.Collection_ID
ORDER BY 
    Number_of_Documents DESC
LIMIT 1;
