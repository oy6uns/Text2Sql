SELECT Package.PackageNumber, Package.Weight
FROM Package
JOIN Client ON Package.Sender = Client.AccountNumber
WHERE Client.Name LIKE '%John%'
ORDER BY Package.Weight DESC
LIMIT 1;
