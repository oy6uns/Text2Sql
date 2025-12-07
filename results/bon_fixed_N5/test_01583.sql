SELECT g.Id, g.Flavor, g.Food, COUNT(*) AS popularity
FROM items i
JOIN goods g ON i.Item = g.Id
GROUP BY g.Id, g.Flavor, g.Food
ORDER BY popularity DESC
LIMIT 3;
