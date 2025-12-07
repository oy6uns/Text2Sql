SELECT COUNT(*) 
FROM Package p
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Client recipient ON p.Recipient = recipient.AccountNumber
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Employee e ON s.Manager = e.EmployeeID
WHERE sender.Name = 'Ogden Wernstrom' AND recipient.Name = 'Leo Wong';
