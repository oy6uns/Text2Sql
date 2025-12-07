SELECT PackageNumber, Weight
FROM Package
JOIN Client ON Package.Sender = Client.AccountNumber
WHERE Client.Name ILIKE '%John%'
ORDER BY Weight DESC
LIMIT 1;
