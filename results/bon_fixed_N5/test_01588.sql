SELECT CustomerId
FROM (
    SELECT r.CustomerId, i.Item, SUM(g.Price) AS total_spent
    FROM receipts r
    JOIN items i ON r.ReceiptNumber = i.Receipt
    JOIN goods g ON i.Item = g.Id
    GROUP BY r.CustomerId, i.Item
) AS customer_item_totals
GROUP BY CustomerId
HAVING AVG(total_spent) > 5;
