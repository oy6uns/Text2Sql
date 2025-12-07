SELECT c.Name
FROM Client c
JOIN Package p ON c.AccountNumber = p.Sender
GROUP BY c.Name
HAVING COUNT(*) > 1;
