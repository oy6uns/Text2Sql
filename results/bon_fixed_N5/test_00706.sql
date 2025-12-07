SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS related_count
FROM Document_Subset_Members
GROUP BY Document_Object_ID
HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4;
