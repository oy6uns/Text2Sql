SELECT COUNT(*) 
FROM Employee e
WHERE NOT EXISTS (
  SELECT 1 
  FROM Has_Clearance hc
  JOIN Planet p ON hc.Planet = p.PlanetID
  WHERE hc.Employee = e.EmployeeID AND p.Name = 'Mars'
)
