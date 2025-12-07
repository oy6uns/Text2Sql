SELECT DISTINCT c.Country
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE TRY_CAST(d.Points AS NUMBER) > 150;
