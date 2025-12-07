SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinimumPrice, MAX(Price) AS MaximumPrice
FROM goods
GROUP BY Food;
