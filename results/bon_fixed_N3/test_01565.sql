SELECT Date, COUNT(DISTINCT CustomerId) AS DistinctCustomers FROM receipts GROUP BY Date ORDER BY Date;
