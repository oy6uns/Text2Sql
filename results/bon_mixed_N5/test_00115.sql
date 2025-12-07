SELECT invoice_number, invoice_date
FROM Invoices
WHERE invoice_number IN (
    SELECT invoice_number
    FROM Shipments
    GROUP BY invoice_number
    HAVING COUNT(DISTINCT shipment_id) >= 2
)
