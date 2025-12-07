SELECT DISTINCT Contents
FROM Boxes
WHERE Contents NOT IN (
    SELECT DISTINCT b.Contents
    FROM Boxes b
    JOIN Warehouses w ON b.Warehouse = w.Code
    WHERE w.Location = 'New York'
)
