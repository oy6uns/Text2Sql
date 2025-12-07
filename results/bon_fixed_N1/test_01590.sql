SELECT Date
FROM receipts
JOIN items ON receipts.ReceiptNumber = items.Receipt
JOIN goods ON items.Item = goods.Id
GROUP BY Date
HAVING SUM(goods.Price) > 100;
