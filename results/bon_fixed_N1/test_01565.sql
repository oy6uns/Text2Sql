SELECT Date, COUNT(DISTINCT CustomerId) AS DistinctCustomerCount
FROM receipts
GROUP BY Date
ORDER BY Date;
