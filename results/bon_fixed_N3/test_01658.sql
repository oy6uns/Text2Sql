SELECT i.Name, c.Nickname
FROM institution i
JOIN Championship c ON i.Institution_ID = c.Institution_ID;
