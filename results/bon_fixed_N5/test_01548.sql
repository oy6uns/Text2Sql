SELECT DISTINCT r.ReceiptNumber
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Price > 10
OR r.Date = (SELECT MIN(Date) FROM receipts)
