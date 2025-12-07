SELECT w.Location, MAX(b.Value) AS MaxBoxValue
FROM Warehouses w
LEFT JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Location;
