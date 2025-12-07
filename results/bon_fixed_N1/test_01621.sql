SELECT c.Capital
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE CAST(d.Points AS FLOAT) = (
    SELECT MAX(CAST(Points AS FLOAT)) FROM driver
);
