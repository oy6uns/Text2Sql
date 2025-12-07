SELECT i.Name
FROM institution i
JOIN Championship c ON i.Institution_ID = c.Institution_ID
ORDER BY c.Number_of_Championships DESC;
