SELECT d.Driver, c.Country
FROM driver d
JOIN country c ON d.Country = c.Country_Id;
