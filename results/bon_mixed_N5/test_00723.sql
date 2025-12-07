SELECT COUNT(DISTINCT Documents_in_Collections.Document_Object_ID) 
FROM Documents_in_Collections 
JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID 
WHERE Collections.Collection_Name = 'Best';
