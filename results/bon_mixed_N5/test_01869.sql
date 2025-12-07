SELECT Package.PackageNumber
FROM Package
JOIN Client ON Package.Recipient = Client.AccountNumber
WHERE Client.Name = 'Leo Wong'
