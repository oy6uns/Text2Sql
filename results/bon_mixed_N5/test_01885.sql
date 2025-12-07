SELECT c.Name
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
GROUP BY c.Name
HAVING COUNT(*) > 1;
