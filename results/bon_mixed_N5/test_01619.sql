SELECT DISTINCT c.Country
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE CAST(d.Points AS INTEGER) > 150;
