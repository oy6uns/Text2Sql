SELECT FirstName, LastName
FROM customers
WHERE Id = (
    SELECT CustomerId
    FROM receipts
    WHERE Date = (
        SELECT MIN(Date)
        FROM receipts
    )
    LIMIT 1
)
