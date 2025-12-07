SELECT ReceiptNumber, Date
FROM receipts
WHERE Date = (SELECT MAX(Date) FROM receipts)
