SELECT Code FROM Warehouses WHERE Capacity < (SELECT COUNT(*) FROM Boxes WHERE Boxes.Warehouse = Warehouses.Code)
