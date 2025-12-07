SELECT c.Id, c.FirstName, c.LastName, COUNT(r.ReceiptNumber) AS PurchaseCount
FROM customers c
JOIN receipts r ON c.Id = r.CustomerId
GROUP BY c.Id, c.FirstName, c.LastName
ORDER BY PurchaseCount DESC
LIMIT 1;
