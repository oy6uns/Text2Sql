SELECT Warehouses.Code
FROM Warehouses
JOIN (
    SELECT Warehouse, COUNT(*) AS box_count
    FROM Boxes
    GROUP BY Warehouse
) AS BoxCounts ON Warehouses.Code = BoxCounts.Warehouse
WHERE BoxCounts.box_count > Warehouses.Capacity;
