SELECT 
  Flavor, 
  MAX(Price) AS HighestPrice, 
  MIN(Price) AS LowestPrice, 
  AVG(Price) AS AveragePrice
FROM goods
GROUP BY Flavor
ORDER BY Flavor;
