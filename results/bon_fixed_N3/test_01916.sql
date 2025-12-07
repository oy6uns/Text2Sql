SELECT COUNT(*) AS NumberOfPackages
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
LEFT JOIN Client sender ON p.Sender = sender.AccountNumber
LEFT JOIN Client recipient ON p.Recipient = recipient.AccountNumber
LEFT JOIN Employee e ON s.Manager = e.EmployeeID
JOIN Planet pl ON s.Planet = pl.PlanetID
WHERE pl.Name = 'Omicron Persei 8'
   OR p.Sender IN (
       SELECT c.AccountNumber
       FROM Client c
       JOIN Package pk ON pk.Sender = c.AccountNumber
       JOIN Shipment sh ON pk.Shipment = sh.ShipmentID
       JOIN Employee emp ON sh.Manager = emp.EmployeeID
       WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber
       FROM Client c
       WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber
       FROM Client c
       WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender IN (
       SELECT c.AccountNumber FROM Client c WHERE c.Name = 'Zapp Brannigan'
   )
   OR p.Sender
