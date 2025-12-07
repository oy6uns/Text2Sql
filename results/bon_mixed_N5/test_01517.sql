SELECT goods.Id, goods.Flavor, goods.Food
FROM goods
LEFT JOIN items ON goods.Id = items.Item
GROUP BY goods.Id, goods.Flavor, goods.Food
ORDER BY COUNT(items.Item) ASC
LIMIT 1;
