SELECT Date, COUNT(DISTINCT CustomerId) AS NumberOfCustomers
FROM receipts
GROUP BY Date
ORDER BY Date;
