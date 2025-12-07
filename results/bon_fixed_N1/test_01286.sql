SELECT MAX(height_mm) AS max_height, paintingID FROM Paintings WHERE year < 1900 GROUP BY paintingID ORDER BY height_mm DESC LIMIT 1;
