SELECT Date
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
GROUP BY Date
HAVING SUM(g.Price) > 100;
