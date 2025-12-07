SELECT MAX(CAST(d.Points AS FLOAT)) AS Max_Points
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE c.Capital = 'Dublin'
