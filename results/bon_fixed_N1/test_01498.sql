SELECT g.Food, COUNT(DISTINCT r.CustomerId) AS NumberOfCustomers
FROM goods g
JOIN items i ON g.Id = i.Item
JOIN receipts r ON i.Receipt = r.ReceiptNumber
GROUP BY g.Food;
