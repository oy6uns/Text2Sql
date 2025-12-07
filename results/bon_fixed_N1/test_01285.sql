SELECT AVG(height_mm) AS avg_height, AVG(width_mm) AS avg_width
FROM Paintings
WHERE medium = 'oil' AND location = 'gallery 241';
