SELECT DISTINCT Boxes.Contents
FROM Boxes
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
WHERE Warehouses.Location = 'New York'
