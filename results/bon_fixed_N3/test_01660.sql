SELECT c.Nickname
FROM Championship c
JOIN institution i ON c.Institution_ID = i.Institution_ID
ORDER BY i.Enrollment
LIMIT 1;
