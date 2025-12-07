SELECT g.Id, g.Flavor, g.Food, g.Price
FROM goods g
LEFT JOIN (
    SELECT i.Item, COUNT(*) AS purchase_count
    FROM items i
    JOIN goods g2 ON i.Item = g2.Id
    WHERE g2.Flavor = 'chocolate'
    GROUP BY i.Item
) AS item_counts ON g.Id = item_counts.Item
WHERE g.Flavor = 'chocolate' AND (item_counts.purchase_count IS NULL OR item_counts.purchase_count <= 10)
