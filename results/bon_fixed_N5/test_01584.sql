SELECT Item, COUNT(*) AS PurchaseCount
FROM items
GROUP BY Item
ORDER BY PurchaseCount DESC
LIMIT 3;
