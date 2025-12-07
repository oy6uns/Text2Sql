SELECT COUNT(*) AS NumberOfPackages
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
LEFT JOIN Client sender ON p.Sender = sender.AccountNumber
LEFT JOIN Client recipient ON p.Recipient = recipient.AccountNumber
LEFT JOIN Employee e ON s.Manager = e.EmployeeID
JOIN Planet pl ON s.Planet = pl.PlanetID
WHERE pl.Name = 'Omicron Persei 8'
   OR p.Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')
