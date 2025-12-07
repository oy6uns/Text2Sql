SELECT 
  c.Collection_Name, 
  c.Collection_ID, 
  COUNT(dic.Document_Object_ID) AS Number_of_Documents
FROM Collections c
LEFT JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
GROUP BY c.Collection_ID, c.Collection_Name
ORDER BY Number_of_Documents DESC
LIMIT 1;
