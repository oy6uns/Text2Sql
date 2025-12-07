SELECT Nickname
FROM Championship
JOIN institution ON Championship.Institution_ID = institution.Institution_ID
ORDER BY Enrollment
LIMIT 1;
