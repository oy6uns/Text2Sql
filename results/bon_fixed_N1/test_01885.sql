SELECT Client.Name
FROM Client
JOIN Package ON Client.AccountNumber = Package.Sender
GROUP BY Client.AccountNumber, Client.Name
HAVING COUNT(*) > 1;
