SELECT c.LastName
FROM customers c
JOIN receipts r ON c.Id = r.CustomerId
GROUP BY c.Id, c.LastName
HAVING COUNT(r.ReceiptNumber) > 10;
