SELECT DISTINCT receipts.CustomerId
FROM receipts
JOIN items ON receipts.ReceiptNumber = items.Receipt
JOIN goods ON items.Item = goods.Id
GROUP BY receipts.CustomerId, goods.Id
HAVING AVG(goods.Price) > 5
