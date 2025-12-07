SELECT COUNT(*) AS NumberOfPackages
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
LEFT JOIN Client sender ON p.Sender = sender.AccountNumber
LEFT JOIN Employee e ON e.Name = 'Zapp Brannigan'
LEFT JOIN Client sender_client ON p.Sender = sender_client.AccountNumber
WHERE s.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8')
   OR p.Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan');
