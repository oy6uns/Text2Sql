SELECT c.Name, COUNT(*) AS PackageCount
FROM Package p
JOIN Client c ON p.Sender = c.AccountNumber
GROUP BY c.Name
ORDER BY PackageCount DESC
LIMIT 1;
