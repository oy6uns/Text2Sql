SELECT DISTINCT ReceiptNumber
FROM receipts
WHERE ReceiptNumber IN (
    SELECT Receipt
    FROM items
    JOIN goods ON items.Item = goods.Id
    WHERE goods.Price > 10
)
OR Date = (SELECT MIN(Date) FROM receipts)
