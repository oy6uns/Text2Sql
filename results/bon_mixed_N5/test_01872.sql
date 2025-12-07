SELECT DISTINCT PackageNumber
FROM Package
JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber
WHERE Client.Name = 'Leo Wong'
