SELECT DISTINCT r.ReceiptNumber
FROM receipts r
JOIN items i ON r.ReceiptNumber = i.Receipt
JOIN goods g ON i.Item = g.Id
WHERE (g.Flavor = 'apple' AND g.Food = 'pie')
   OR r.CustomerId = 12;
