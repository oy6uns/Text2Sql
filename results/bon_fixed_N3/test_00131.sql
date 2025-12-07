SELECT d.Name
FROM director d
JOIN program p ON d.Director_ID = p.Director_ID
WHERE p.Title = 'Dracula'
