SELECT SUM(c.Number_of_Championships) AS total_championships
FROM Championship c
JOIN institution i ON c.Institution_ID = i.Institution_ID
WHERE i.Affiliation = 'Public';
