SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes) LIMIT 1;
