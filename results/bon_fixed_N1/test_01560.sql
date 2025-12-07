SELECT Food, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM goods
GROUP BY Food
ORDER BY Food;
