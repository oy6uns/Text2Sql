SELECT goods.Id, goods.Food, COUNT(*) AS popularity
FROM items
JOIN goods ON items.Item = goods.Id
GROUP BY goods.Id, goods.Food
ORDER BY popularity DESC
LIMIT 3;
