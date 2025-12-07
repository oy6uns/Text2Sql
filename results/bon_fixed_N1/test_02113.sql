SELECT invoice_id, COUNT(payment_id) AS number_of_payments
FROM Invoices
LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id
GROUP BY invoice_id;
