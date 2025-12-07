SELECT DISTINCT i.Item
FROM items i
JOIN receipts r ON i.Receipt = r.ReceiptNumber
WHERE r.CustomerId = 15;
