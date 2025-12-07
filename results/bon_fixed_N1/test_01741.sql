SELECT W.Location, MAX(B.Value) AS MaxValue
FROM Boxes B
JOIN Warehouses W ON B.Warehouse = W.Code
GROUP BY W.Location;
