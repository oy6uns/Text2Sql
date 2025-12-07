SELECT invoice_id, invoice_status, invoice_details
FROM Invoices
WHERE invoice_id = (
    SELECT invoice_id
    FROM Payments
    GROUP BY invoice_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
