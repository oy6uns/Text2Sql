SELECT DISTINCT items.Item
FROM items
JOIN receipts ON items.Receipt = receipts.ReceiptNumber
WHERE receipts.CustomerId = 15;
