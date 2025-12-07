SELECT CustomerId
FROM (
  SELECT r.CustomerId, SUM(g.Price) AS total_spent
  FROM receipts r
  JOIN items i ON r.ReceiptNumber = i.Receipt
  JOIN goods g ON i.Item = g.Id
  GROUP BY r.CustomerId
) sub
WHERE total_spent > 150;
