SELECT DISTINCT p.PackageNumber
FROM Package p
JOIN Shipment s ON p.Shipment = s.ShipmentID
JOIN Planet pl ON s.Planet = pl.PlanetID
LEFT JOIN Client sender ON p.Sender = sender.AccountNumber
LEFT JOIN Client recipient ON p.Recipient = recipient.AccountNumber
LEFT JOIN Employee e ON e.Name = 'Zapp Brannigan'
WHERE pl.Name = 'Omicron Persei 8' OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    JOIN Package pk ON c.AccountNumber = pk.Sender
    JOIN Employee em ON em.Name = 'Zapp Brannigan'
    WHERE em.EmployeeID = (SELECT EmployeeID FROM Employee WHERE Name = 'Zapp Brannigan')
) OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    WHERE EXISTS (
        SELECT 1 FROM Employee e WHERE e.Name = 'Zapp Brannigan' AND e.EmployeeID = p.Sender
    )
) OR EXISTS (
    SELECT 1 FROM Employee e WHERE e.Name = 'Zapp Brannigan' AND e.EmployeeID = p.Sender
) OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    WHERE c.AccountNumber IN (
        SELECT p2.Sender FROM Package p2
        JOIN Employee e ON e.Name = 'Zapp Brannigan' WHERE e.EmployeeID = p2.Sender
    )
)
OR p.Sender IN (
    SELECT p3.Sender FROM Package p3
    JOIN Employee e ON e.Name = 'Zapp Brannigan' WHERE e.EmployeeID = p3.Sender
)
OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    WHERE c.AccountNumber IN (
        SELECT p4.Sender FROM Package p4
        JOIN Employee e ON e.Name = 'Zapp Brannigan' AND e.EmployeeID = p4.Sender
    )
)
OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    WHERE c.AccountNumber IN (
        SELECT p5.Sender FROM Package p5
        JOIN Employee e ON e.Name = 'Zapp Brannigan' AND e.EmployeeID = p5.Sender
    )
)
OR p.Sender IN (
    SELECT c.AccountNumber FROM Client c
    WHERE c.AccountNumber IN (
        SELECT p6.Sender FROM Package p6
        JOIN Employee e ON e.Name = 'Zapp Brannigan' AND
