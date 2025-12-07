SELECT MAX(CAST(driver.Points AS FLOAT)) AS Max_Points
FROM driver
JOIN country ON driver.Country = country.Country_Id
WHERE country.Capital = 'Dublin'
