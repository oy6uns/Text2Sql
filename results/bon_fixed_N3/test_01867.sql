SELECT PackageNumber
FROM Package
JOIN Client ON Package.Sender = Client.AccountNumber
WHERE Client.Name = 'Leo Wong'
