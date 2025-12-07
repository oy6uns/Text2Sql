SELECT r.ReceiptNumber, r.Date
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Price = (
    SELECT MAX(g2.Price)
    FROM items i2
    JOIN goods g2 ON i2.Item = g2.Id
) 
LIMIT 1;
