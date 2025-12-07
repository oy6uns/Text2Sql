SELECT Date, COUNT(DISTINCT CustomerId) AS CustomerCount
FROM receipts
GROUP BY Date
ORDER BY Date;
