SELECT Warehouse, COUNT(DISTINCT Contents) AS DifferentContentTypes FROM Boxes GROUP BY Warehouse;
