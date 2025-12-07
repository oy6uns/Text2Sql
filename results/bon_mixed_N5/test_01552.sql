SELECT FirstName || ' ' || LastName AS FullName
FROM customers
JOIN receipts ON customers.Id = receipts.CustomerId
WHERE receipts.Date = (SELECT MIN(Date) FROM receipts);
