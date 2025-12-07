SELECT c.Name, COUNT(*) AS NumberOfPackagesSent
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
GROUP BY c.Name
ORDER BY NumberOfPackagesSent DESC
LIMIT 1;
