SELECT c.FirstName, c.LastName
FROM customers c
JOIN receipts r ON c.Id = r.CustomerId
WHERE r.Date = (SELECT MIN(Date) FROM receipts)
