SELECT CustomerId
FROM (
    SELECT r.CustomerId, i.Item, AVG(g.Price) AS avg_spending
    FROM receipts r
    JOIN items i ON r.ReceiptNumber = i.Receipt
    JOIN goods g ON i.Item = g.Id
    GROUP BY r.CustomerId, i.Item
) sub
GROUP BY CustomerId
HAVING MIN(avg_spending) > 5;
