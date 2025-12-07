SELECT DISTINCT w.Location
FROM Warehouses w
JOIN Boxes b1 ON w.Code = b1.Warehouse
WHERE b1.Contents = 'Rocks'
  AND w.Code NOT IN (
    SELECT Warehouse
    FROM Boxes
    WHERE Contents = 'Scissors'
  );
