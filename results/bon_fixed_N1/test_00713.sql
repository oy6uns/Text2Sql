SELECT 
    dsm.Document_Subset_ID, 
    ds.Document_Subset_Name, 
    COUNT(DISTINCT dsm.Document_Object_ID) AS number_of_documents
FROM 
    Document_Subset_Members dsm
JOIN 
    Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID
GROUP BY 
    dsm.Document_Subset_ID, ds.Document_Subset_Name
ORDER BY 
    number_of_documents DESC
LIMIT 1;
