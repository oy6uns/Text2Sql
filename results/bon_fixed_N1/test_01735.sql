SELECT Contents, COUNT(*) AS number_of_boxes, SUM(Value) AS total_value FROM Boxes GROUP BY Contents;
