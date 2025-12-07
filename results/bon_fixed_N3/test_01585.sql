SELECT r.CustomerId
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
GROUP BY r.CustomerId
HAVING SUM(g.Price) > 150;
