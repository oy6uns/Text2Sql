SELECT invoice_id, COUNT(payment_id) AS payment_count
FROM Payments
GROUP BY invoice_id;
