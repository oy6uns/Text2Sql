SELECT AVG(Units_sold_Millions) AS avg_units_sold
FROM game
WHERE Developers NOT LIKE '%Nintendo%'
