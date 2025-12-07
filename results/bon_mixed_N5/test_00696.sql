SELECT COUNT(*) 
FROM Collections AS c_child
JOIN Collections AS c_parent ON c_child.Parent_Collection_ID = c_parent.Collection_ID
WHERE c_parent.Collection_Name = 'Best';
