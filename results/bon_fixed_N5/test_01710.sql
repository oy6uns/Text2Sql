SELECT DISTINCT b1.Contents
FROM Boxes b1
JOIN Warehouses w1 ON b1.Warehouse = w1.Code
JOIN Boxes b2 ON b1.Contents = b2.Contents
JOIN Warehouses w2 ON b2.Warehouse = w2.Code
WHERE w1.Location = 'Chicago' AND w2.Location = 'New York'
