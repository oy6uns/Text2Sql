SELECT COUNT(*) 
FROM Collections c
WHERE c.Parent_Collection_ID = (
    SELECT Collection_ID 
    FROM Collections 
    WHERE Collection_Name = 'Best'
);
