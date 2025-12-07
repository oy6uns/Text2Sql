SELECT COUNT(*) 
FROM Collections c
JOIN Collections parent ON c.Parent_Collection_ID = parent.Collection_ID
WHERE parent.Collection_Name = 'Best';
