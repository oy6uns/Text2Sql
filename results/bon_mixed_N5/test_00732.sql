SELECT DISTINCT doc_obj.Document_Object_ID
FROM Documents_in_Collections doc_coll
JOIN Collections coll ON doc_coll.Collection_ID = coll.Collection_ID
JOIN Document_Objects doc_obj ON doc_coll.Document_Object_ID = doc_obj.Document_Object_ID
WHERE coll.Collection_Name = 'Best'
AND doc_obj.Document_Object_ID NOT IN (
    SELECT dsm.Document_Object_ID
    FROM Document_Subset_Members dsm
    JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID
    WHERE ds.Document_Subset_Name = 'Best for 2000'
)
