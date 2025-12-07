SELECT Date, COUNT(*) AS ReceiptCount
FROM receipts
GROUP BY Date
ORDER BY ReceiptCount DESC
LIMIT 3;
