SELECT LastName
FROM customers
WHERE Id IN (
    SELECT CustomerId
    FROM receipts
    GROUP BY CustomerId
    HAVING COUNT(DISTINCT ReceiptNumber) > 10
)
