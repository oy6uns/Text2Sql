SELECT a.lname, a.fname, AVG(p.height_mm) AS avg_height_mm, AVG(p.width_mm) AS avg_width_mm
FROM Paintings p
JOIN Artists a ON p.painterID = a.artistID
GROUP BY a.lname, a.fname
ORDER BY a.lname, a.fname;
