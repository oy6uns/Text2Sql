SELECT Date, COUNT(DISTINCT CustomerId) AS distinct_customers FROM receipts GROUP BY Date ORDER BY Date;
