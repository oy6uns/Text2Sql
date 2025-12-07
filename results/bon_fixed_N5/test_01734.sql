SELECT Warehouse, AVG(Value) AS avg_value
FROM Boxes
GROUP BY Warehouse
HAVING AVG(Value) > 150;
