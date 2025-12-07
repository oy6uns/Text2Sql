SELECT CustomerId
FROM receipts
GROUP BY CustomerId
HAVING COUNT(ReceiptNumber) >= 15;
