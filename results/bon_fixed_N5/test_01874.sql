SELECT COUNT(*) 
FROM Package p
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Client recipient ON p.Recipient = recipient.AccountNumber
JOIN Employee e_sender ON sender.AccountNumber = (
    SELECT AccountNumber FROM Client WHERE Name = 'Ogden Wernstrom'
)
JOIN Employee e_recipient ON recipient.AccountNumber = (
    SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong'
)
WHERE sender.Name = 'Ogden Wernstrom' AND recipient.Name = 'Leo Wong';
