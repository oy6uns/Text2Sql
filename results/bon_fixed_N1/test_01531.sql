SELECT DISTINCT items.Receipt
FROM items
JOIN goods ON items.Item = goods.Id
WHERE goods.Price > 13;
