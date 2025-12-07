SELECT DISTINCT b.Contents
FROM Boxes b
WHERE b.Contents NOT IN (
    SELECT b2.Contents
    FROM Boxes b2
    JOIN Warehouses w ON b2.Warehouse = w.Code
    WHERE w.Location = 'New York'
);
