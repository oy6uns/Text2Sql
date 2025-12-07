SELECT COUNT(*) AS NumberOfPackages
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Planet pl ON s.Planet = pl.PlanetID
JOIN Client sender ON p.Sender = sender.AccountNumber
JOIN Employee e ON e.Name = 'Zapp Brannigan'
WHERE pl.Name = 'Omicron Persei 8'
  AND sender.AccountNumber IN (
    SELECT AccountNumber FROM Client WHERE Name = (
      SELECT Name FROM Employee WHERE EmployeeID = e.EmployeeID
    )
  )
  AND EXISTS (
    SELECT 1 FROM Client c WHERE c.AccountNumber = p.Sender AND c.Name = (
      SELECT Name FROM Employee WHERE Name = 'Zapp Brannigan'
    )
  )
;
