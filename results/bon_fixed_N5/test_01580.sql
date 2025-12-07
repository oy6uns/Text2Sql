SELECT g.Id, g.Flavor, g.Food, g.Price
FROM goods g
JOIN items i ON g.Id = i.Item
WHERE g.Flavor = 'chocolate'
GROUP BY g.Id, g.Flavor, g.Food, g.Price
HAVING COUNT(i.Item) <= 10;
