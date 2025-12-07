SELECT Contents, SUM(Value) AS TotalValue, COUNT(*) AS NumberOfBoxes FROM Boxes GROUP BY Contents;
