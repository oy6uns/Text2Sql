SELECT g.Id, g.Flavor, g.Food, g.Price
FROM goods g
LEFT JOIN (
    SELECT i.Item, COUNT(*) AS purchase_count
    FROM items i
    JOIN goods g2 ON i.Item = g2.Id
    WHERE g2.Flavor = 'chocolate'
    GROUP BY i.Item
) c ON g.Id = c.Item
WHERE g.Flavor = 'chocolate' AND (c.purchase_count IS NULL OR c.purchase_count <= 10)
