SELECT p.*
FROM Package p
JOIN Client c_sender ON p.Sender = c_sender.AccountNumber
JOIN Client c_recipient ON p.Recipient = c_recipient.AccountNumber
WHERE c_sender.Name = 'Leo Wong' OR c_recipient.Name = 'Leo Wong'
