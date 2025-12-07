SELECT COUNT(*) 
FROM Collections c_parent
JOIN Collections c_child ON c_child.Parent_Collection_ID = c_parent.Collection_ID
WHERE c_parent.Collection_Name = 'Best';
