SELECT MAX(CAST(driver.Points AS FLOAT)) AS max_points
FROM driver
JOIN country ON driver.Country = country.Country_Id
WHERE country.Capital = 'Dublin'
