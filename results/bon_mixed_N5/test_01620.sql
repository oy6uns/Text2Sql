SELECT DISTINCT country.Country
FROM driver
JOIN country ON driver.Country = country.Country_Id
WHERE CAST(driver.Points AS INTEGER) > 150;
