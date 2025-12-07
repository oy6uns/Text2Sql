SELECT DISTINCT r.ReceiptNumber
FROM receipts r
LEFT JOIN items i ON r.ReceiptNumber = i.Receipt
LEFT JOIN goods g ON i.Item = g.Id
WHERE r.Date = (SELECT MIN(Date) FROM receipts)
   OR g.Price > 10;
