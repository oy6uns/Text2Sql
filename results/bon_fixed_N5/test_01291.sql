SELECT a.fname, a.lname, AVG(p.height_mm) AS avg_height_mm, AVG(p.width_mm) AS avg_width_mm
FROM Artists a
JOIN Paintings p ON a.artistID = p.painterID
GROUP BY a.fname, a.lname
ORDER BY a.lname, a.fname;
