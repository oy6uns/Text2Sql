SELECT 
    d.Document_Object_ID, 
    COUNT(r.Related_Document_Object_ID) AS Number_of_Related_Documents
FROM 
    Document_Objects d
LEFT JOIN 
    Document_Subset_Members r ON d.Document_Object_ID = r.Document_Object_ID
GROUP BY 
    d.Document_Object_ID
ORDER BY 
    Number_of_Related_Documents ASC
LIMIT 1;
