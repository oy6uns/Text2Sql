SELECT AVG(Units_sold_Millions) AS avg_units_sold
FROM game
WHERE Developers <> 'Nintendo' OR Developers IS NULL;
