SELECT 
  Food,
  AVG(Price) AS AveragePrice,
  MAX(Price) AS MaxPrice,
  MIN(Price) AS MinPrice
FROM goods
GROUP BY Food;
