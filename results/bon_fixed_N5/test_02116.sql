SELECT invoice_id, invoice_status, invoice_details
FROM Invoices
WHERE invoice_id IN (
    SELECT invoice_id
    FROM Payments
    GROUP BY invoice_id
    HAVING COUNT(*) = (
        SELECT MAX(payment_count)
        FROM (
            SELECT COUNT(*) AS payment_count
            FROM Payments
            GROUP BY invoice_id
        ) AS counts
    )
)
