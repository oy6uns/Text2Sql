SELECT d.Document_Object_ID, 
       COALESCE(COUNT(r.Related_Document_Object_ID), 0) AS related_documents_count
FROM Document_Objects d
LEFT JOIN Document_Subset_Members r ON d.Document_Object_ID = r.Document_Object_ID
GROUP BY d.Document_Object_ID
ORDER BY related_documents_count ASC
LIMIT 1;
