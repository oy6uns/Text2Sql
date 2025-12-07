SELECT Name
FROM Employee
WHERE EmployeeID NOT IN (
    SELECT Employee
    FROM Has_Clearance
    JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID
    WHERE Planet.Name = 'Mars'
)
