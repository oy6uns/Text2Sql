SELECT CustomerId
FROM receipts
JOIN items ON receipts.ReceiptNumber = items.Receipt
JOIN goods ON items.Item = goods.Id
GROUP BY CustomerId
HAVING SUM(goods.Price) > 150;
