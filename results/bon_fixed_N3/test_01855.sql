SELECT Client.Name
FROM Package
JOIN Client ON Package.Recipient = Client.AccountNumber
ORDER BY Package.Weight DESC
LIMIT 1;
