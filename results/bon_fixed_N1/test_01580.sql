SELECT g.Id, g.Flavor, g.Food
FROM goods g
JOIN items i ON g.Id = i.Item
WHERE g.Flavor = 'chocolate'
GROUP BY g.Id, g.Flavor, g.Food
HAVING COUNT(*) <= 10;
