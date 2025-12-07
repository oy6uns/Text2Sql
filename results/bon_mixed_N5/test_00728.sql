SELECT c.Collection_Name, c.Collection_ID, COUNT(d.Document_Object_ID) AS Document_Count
FROM Collections c
LEFT JOIN Documents_in_Collections d ON c.Collection_ID = d.Collection_ID
WHERE c.Collection_Name = 'Best'
GROUP BY c.Collection_ID, c.Collection_Name
ORDER BY Document_Count DESC
LIMIT 1;
