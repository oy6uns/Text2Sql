SELECT COALESCE(SUM(p.Weight), 0) AS TotalWeight
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
WHERE c.Name = 'Leo Wong'
