SELECT DISTINCT r.ReceiptNumber
FROM receipts r
LEFT JOIN items i ON r.ReceiptNumber = i.Receipt
LEFT JOIN goods g ON i.Item = g.Id
WHERE g.Flavor = 'apple' AND g.Food = 'pie'
   OR r.CustomerId = 12;
