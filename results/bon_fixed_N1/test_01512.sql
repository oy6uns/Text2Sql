SELECT DISTINCT i1.Receipt
FROM items i1
JOIN goods g1 ON i1.Item = g1.Id
JOIN items i2 ON i1.Receipt = i2.Receipt
JOIN goods g2 ON i2.Item = g2.Id
WHERE g1.Food = 'cake' AND g2.Food = 'cookie';
