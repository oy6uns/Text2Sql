SELECT c.Capital
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE TRY_TO_NUMBER(d.Points) = (
    SELECT MAX(TRY_TO_NUMBER(Points))
    FROM driver
);
