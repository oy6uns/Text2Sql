SELECT W.Code
FROM Warehouses W
JOIN Boxes B ON W.Code = B.Warehouse
GROUP BY W.Code, W.Capacity
HAVING COUNT(B.Code) > W.Capacity;
