SELECT Collection_Name 
FROM Collections c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Collections c2 
    WHERE c2.Parent_Collection_ID = c.Collection_ID
);
