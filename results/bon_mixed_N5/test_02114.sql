SELECT invoice_id, COUNT(*) AS payment_count FROM Payments GROUP BY invoice_id;
