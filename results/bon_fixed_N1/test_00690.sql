SELECT parent.Collection_Name
FROM Collections AS child
JOIN Collections AS parent ON child.Parent_Collection_ID = parent.Collection_ID
WHERE child.Collection_Name = 'Nice';
