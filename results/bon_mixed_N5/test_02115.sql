SELECT i.invoice_id, i.invoice_status, i.invoice_details
FROM Invoices i
JOIN (
    SELECT invoice_id, COUNT(*) AS payment_count
    FROM Payments
    GROUP BY invoice_id
    ORDER BY payment_count DESC
    LIMIT 1
) p ON i.invoice_id = p.invoice_id;
