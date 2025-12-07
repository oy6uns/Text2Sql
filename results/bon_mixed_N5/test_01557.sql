SELECT 
  Flavor,
  MAX(Price) AS Highest_Price,
  MIN(Price) AS Lowest_Price,
  AVG(Price) AS Average_Price
FROM goods
GROUP BY Flavor
ORDER BY Flavor;
