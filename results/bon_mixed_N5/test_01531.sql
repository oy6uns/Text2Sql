SELECT DISTINCT i.Receipt
FROM items i
JOIN goods g ON i.Item = g.Id
WHERE g.Price > 13;
