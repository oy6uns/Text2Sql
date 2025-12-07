SELECT goods.Id, goods.Flavor, goods.Food, COUNT(*) AS purchase_count
FROM items
JOIN goods ON items.Item = goods.Id
GROUP BY goods.Id, goods.Flavor, goods.Food
ORDER BY purchase_count ASC
LIMIT 1;
