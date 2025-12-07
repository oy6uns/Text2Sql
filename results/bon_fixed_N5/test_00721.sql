SELECT Document_Object_ID, COUNT(Collection_ID) AS Collection_Count
FROM Documents_in_Collections
GROUP BY Document_Object_ID;
