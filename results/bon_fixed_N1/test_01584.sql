SELECT goods.Id, goods.Food, COUNT(*) AS purchase_count
FROM items
JOIN goods ON items.Item = goods.Id
GROUP BY goods.Id, goods.Food
ORDER BY purchase_count DESC
LIMIT 3;
