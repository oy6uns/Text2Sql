SELECT DISTINCT c.Country
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE TRY_TO_NUMBER(d.Points) > 150;
