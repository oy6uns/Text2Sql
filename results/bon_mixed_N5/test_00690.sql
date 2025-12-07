SELECT DISTINCT parent.Collection_Name
FROM Collections child
JOIN Collections parent ON child.Parent_Collection_ID = parent.Collection_ID
WHERE child.Collection_Name = 'Nice'
