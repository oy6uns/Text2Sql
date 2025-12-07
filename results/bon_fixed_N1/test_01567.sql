SELECT DISTINCT c.FirstName, c.LastName
FROM customers c
JOIN receipts r ON c.Id = r.CustomerId
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE g.Flavor = 'apple' AND g.Food = 'Tart'
