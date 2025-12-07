SELECT FirstName, LastName
FROM customers
WHERE Id IN (
    SELECT CustomerId
    FROM receipts
    WHERE Date = (SELECT MIN(Date) FROM receipts)
)
