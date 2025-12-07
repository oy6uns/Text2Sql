SELECT CustomerId AS Id
FROM (
    SELECT r.CustomerId, SUM(g.Price) AS TotalSpent
    FROM receipts r
    JOIN items i ON r.ReceiptNumber = i.Receipt
    JOIN goods g ON i.Item = g.Id
    GROUP BY r.CustomerId
) sub
WHERE TotalSpent > 150;
