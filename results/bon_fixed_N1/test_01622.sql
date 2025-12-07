SELECT c.Capital
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE TRY_CAST(d.Points AS FLOAT) = (
    SELECT MAX(TRY_CAST(Points AS FLOAT)) FROM driver
)
