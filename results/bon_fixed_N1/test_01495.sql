SELECT DISTINCT r.CustomerId
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
