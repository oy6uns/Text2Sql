SELECT CustomerId AS Id
FROM receipts
GROUP BY CustomerId
HAVING COUNT(*) >= 15;
