SELECT parent.Owner
FROM Document_Objects child
JOIN Document_Objects parent ON child.Parent_Document_Object_ID = parent.Document_Object_ID
WHERE child.Owner = 'Marlin'
