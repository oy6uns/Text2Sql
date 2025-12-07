SELECT SUM(b.Value) AS total_value
FROM Boxes b
JOIN Warehouses w ON b.Warehouse = w.Code
WHERE w.Capacity = (SELECT MAX(Capacity) FROM Warehouses);
