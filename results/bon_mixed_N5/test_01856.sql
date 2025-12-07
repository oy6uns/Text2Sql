SELECT c.Name
FROM Package p
JOIN Client c ON p.Recipient = c.AccountNumber
ORDER BY p.Weight DESC
LIMIT 1;
