SELECT Package.PackageNumber
FROM Package
JOIN Shipment ON Package.Shipment = Shipment.ShipmentID
JOIN Planet ON Shipment.Planet = Planet.PlanetID
LEFT JOIN Client AS SenderClient ON Package.Sender = SenderClient.AccountNumber
LEFT JOIN Client AS RecipientClient ON Package.Recipient = RecipientClient.AccountNumber
LEFT JOIN Employee ON Package.Sender = Employee.EmployeeID
WHERE Planet.Name = 'Omicron Persei 8'
   OR Package.Sender IN (
       SELECT Client.AccountNumber
       FROM Client
       JOIN Employee ON Employee.Name = 'Zapp Brannigan'
       WHERE Client.AccountNumber = Package.Sender
   );
