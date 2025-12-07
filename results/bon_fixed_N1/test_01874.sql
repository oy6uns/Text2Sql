SELECT COUNT(*) 
FROM Package p
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Client recipient ON p.Recipient = recipient.AccountNumber
JOIN Employee e ON sender.AccountNumber = e.EmployeeID
WHERE sender.Name = 'Ogden Wernstrom' AND recipient.Name = 'Leo Wong';
