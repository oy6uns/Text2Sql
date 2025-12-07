SELECT 
    ds.Document_Subset_ID, 
    ds.Document_Subset_Name, 
    COUNT(DISTINCT dsm.Document_Object_ID) AS num_documents
FROM Document_Subsets ds
JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID
GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name
ORDER BY num_documents DESC
LIMIT 1;
