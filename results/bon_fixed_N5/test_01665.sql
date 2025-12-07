SELECT SUM(Number_of_Championships) AS Total_Championships
FROM Championship c
JOIN institution i ON c.Institution_ID = i.Institution_ID
WHERE i.Affiliation = 'public';
