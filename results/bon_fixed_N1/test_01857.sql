SELECT COALESCE(SUM(P.Weight), 0) AS TotalWeight
FROM Package P
JOIN Client C ON P.Sender = C.AccountNumber
WHERE C.Name = 'Leo Wong';
