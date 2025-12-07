SELECT g.Id, g.Flavor, g.Food, g.Price
FROM goods g
LEFT JOIN (
    SELECT i.Item, COUNT(*) AS purchase_count
    FROM items i
    GROUP BY i.Item
) ic ON g.Id = ic.Item
WHERE g.Flavor = 'chocolate' AND (ic.purchase_count IS NULL OR ic.purchase_count <= 10)
