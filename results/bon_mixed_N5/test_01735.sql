SELECT Contents, SUM(Value) AS total_value, COUNT(*) AS number_of_boxes FROM Boxes GROUP BY Contents;
