SELECT COUNT(*) 
FROM Package p
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Client recipient ON p.Recipient = recipient.AccountNumber
JOIN Employee e_sender ON sender.AccountNumber = e_sender.EmployeeID
JOIN Employee e_recipient ON recipient.AccountNumber = e_recipient.EmployeeID
WHERE p.Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Ogden Wernstrom')
  AND p.Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong');
