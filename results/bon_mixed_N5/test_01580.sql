SELECT g.Id, g.Flavor, g.Food, COUNT(i.Item) AS purchase_count
FROM goods g
JOIN items i ON g.Id = i.Item
WHERE g.Flavor = 'chocolate'
GROUP BY g.Id, g.Flavor, g.Food
HAVING COUNT(i.Item) <= 10;
