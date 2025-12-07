SELECT c.Name
FROM Package p
JOIN Client c ON p.Recipient = c.AccountNumber
WHERE p.Weight = (SELECT MAX(Weight) FROM Package)
