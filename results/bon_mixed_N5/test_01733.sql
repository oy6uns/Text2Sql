SELECT Warehouse, AVG(Value) AS AvgValue
FROM Boxes
GROUP BY Warehouse
HAVING AVG(Value) > 150;
