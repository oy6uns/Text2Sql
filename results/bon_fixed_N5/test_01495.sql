SELECT DISTINCT c.Id
FROM customers c
JOIN receipts r ON c.Id = r.CustomerId
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
