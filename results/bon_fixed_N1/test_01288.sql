SELECT year, MAX(height_mm) AS max_height_mm, MAX(width_mm) AS max_width_mm
FROM Paintings
GROUP BY year
ORDER BY year;
