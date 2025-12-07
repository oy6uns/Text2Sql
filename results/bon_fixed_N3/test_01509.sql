SELECT Food, AVG(Price) AS AveragePrice, MAX(Price) AS MaximumPrice, MIN(Price) AS MinimumPrice
FROM goods
GROUP BY Food;
