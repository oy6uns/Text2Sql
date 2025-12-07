SELECT COUNT(*) 
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
WHERE c.Name = 'Leo Wong';
