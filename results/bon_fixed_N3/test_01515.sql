SELECT r.ReceiptNumber, r.Date
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Price = (SELECT MAX(Price) FROM goods)
LIMIT 1;
