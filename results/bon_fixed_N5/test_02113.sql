SELECT invoice_id, COUNT(payment_id) AS number_of_payments
FROM Payments
GROUP BY invoice_id;
