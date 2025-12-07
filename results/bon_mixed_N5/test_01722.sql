SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes) LIMIT 1;
