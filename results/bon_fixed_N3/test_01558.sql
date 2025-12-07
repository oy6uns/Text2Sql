SELECT Flavor, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice, AVG(Price) AS AvgPrice
FROM goods
GROUP BY Flavor
ORDER BY Flavor;
