SELECT goods.Id, goods.Flavor, goods.Food, goods.Price
FROM goods
LEFT JOIN items ON goods.Id = items.Item
GROUP BY goods.Id, goods.Flavor, goods.Food, goods.Price
ORDER BY COUNT(items.Item)
LIMIT 1;
