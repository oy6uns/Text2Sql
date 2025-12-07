SELECT p.Name
FROM player p
JOIN club c ON p.Club_ID = c.Club_ID
WHERE c.Manager = 'Sam Allardyce'
