SELECT AVG(height_mm) AS avg_height_mm, AVG(width_mm) AS avg_width_mm
FROM Paintings
WHERE medium = 'oil' AND location = 'gallery 241';
