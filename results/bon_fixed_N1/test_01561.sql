SELECT Date, COUNT(*) AS receipt_count
FROM receipts
GROUP BY Date
ORDER BY receipt_count DESC
LIMIT 3;
