SELECT i.Name
FROM institution i
JOIN Championship c ON i.Institution_ID = c.Institution_ID
WHERE c.Number_of_Championships >= 1;
