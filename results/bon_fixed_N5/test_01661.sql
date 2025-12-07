SELECT i.Name
FROM institution i
LEFT JOIN Championship c ON i.Institution_ID = c.Institution_ID
ORDER BY COALESCE(c.Number_of_Championships, 0) DESC;
