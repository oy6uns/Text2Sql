SELECT CustomerId, COUNT(*) AS NumberOfPurchases
FROM receipts
GROUP BY CustomerId
ORDER BY NumberOfPurchases DESC
LIMIT 1;
