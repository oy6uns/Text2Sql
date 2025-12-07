SELECT DISTINCT goods.Id
FROM goods
JOIN items ON goods.Id = items.Item
JOIN receipts ON items.Receipt = receipts.ReceiptNumber
WHERE receipts.CustomerId = 15;
