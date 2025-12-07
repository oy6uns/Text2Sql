SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice
FROM goods
GROUP BY Food
ORDER BY Food;
