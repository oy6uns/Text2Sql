SELECT e.Name
FROM Employee e
JOIN Has_Clearance hc ON e.EmployeeID = hc.Employee
JOIN Planet p ON hc.Planet = p.PlanetID
WHERE p.Name = 'Omega III';
