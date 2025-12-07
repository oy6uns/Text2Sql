SELECT Client.Name, COUNT(*) AS NumberOfPackagesSent
FROM Package
JOIN Client ON Package.Sender = Client.AccountNumber
GROUP BY Client.Name
ORDER BY NumberOfPackagesSent DESC
LIMIT 1;
