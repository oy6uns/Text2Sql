SELECT p.*
FROM Package p
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Client recipient ON p.Recipient = recipient.AccountNumber
WHERE sender.Name = 'Leo Wong' OR recipient.Name = 'Leo Wong'
