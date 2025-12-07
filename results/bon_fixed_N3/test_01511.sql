SELECT r.ReceiptNumber
FROM receipts r
JOIN items i1 ON r.ReceiptNumber = i1.Receipt
JOIN goods g1 ON i1.Item = g1.Id
JOIN items i2 ON r.ReceiptNumber = i2.Receipt
JOIN goods g2 ON i2.Item = g2.Id
WHERE g1.Food = 'Cake' AND g2.Food = 'Cookie'
GROUP BY r.ReceiptNumber;
