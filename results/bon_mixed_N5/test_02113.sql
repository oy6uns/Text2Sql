SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS number_of_payments
FROM Invoices
LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id
GROUP BY Invoices.invoice_id;
