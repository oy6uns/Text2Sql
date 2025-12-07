SELECT Item, COUNT(*) AS purchase_count
FROM items
GROUP BY Item
ORDER BY purchase_count DESC
LIMIT 3;
