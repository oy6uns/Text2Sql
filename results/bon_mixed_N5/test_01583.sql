SELECT goods.Id, goods.Flavor, goods.Food, COUNT(*) AS popularity
FROM items
JOIN goods ON items.Item = goods.Id
GROUP BY goods.Id, goods.Flavor, goods.Food
ORDER BY popularity DESC
LIMIT 3;
