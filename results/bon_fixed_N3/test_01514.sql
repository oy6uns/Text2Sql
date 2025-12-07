SELECT DISTINCT r.ReceiptNumber
FROM receipts r
JOIN customers c ON r.CustomerId = c.Id
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE c.LastName = 'Logan' AND g.Food = 'croissant'
