SELECT DISTINCT p.PackageNumber
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Planet pl ON s.Planet = pl.PlanetID
LEFT JOIN Client sender ON p.Sender = sender.AccountNumber
LEFT JOIN Client recipient ON p.Recipient = recipient.AccountNumber
LEFT JOIN Employee e ON e.Name = 'Zapp Brannigan'
LEFT JOIN Package p2 ON p2.Sender = sender.AccountNumber
WHERE pl.Name = 'Omicron Persei 8'
   OR p.Sender IN (
       SELECT c.AccountNumber
       FROM Client c
       JOIN Package pk ON pk.Sender = c.AccountNumber
       JOIN Shipment sh ON pk.Shipment = sh.ShipmentID
       JOIN Employee em ON em.Name = 'Zapp Brannigan'
       WHERE em.EmployeeID = e.EmployeeID
   )
   OR p.Sender IN (
       SELECT c.AccountNumber
       FROM Client c
       WHERE EXISTS (
           SELECT 1
           FROM Employee em
           WHERE em.Name = 'Zapp Brannigan'
           AND em.EmployeeID IN (
               SELECT p.Manager FROM Shipment p WHERE p.ShipmentID = p.Shipment
           )
       )
   );
