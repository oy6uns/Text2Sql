SELECT p.Name
FROM Planet p
JOIN Has_Clearance hc ON p.PlanetID = hc.Planet
GROUP BY p.PlanetID, p.Name
HAVING COUNT(DISTINCT hc.Employee) = 1;
