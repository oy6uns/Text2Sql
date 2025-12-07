SELECT 
  i.invoice_status,
  i.invoice_details,
  c.client_id,
  c.client_details,
  a.agency_id,
  a.agency_details
FROM Invoices i
JOIN Clients c ON i.client_id = c.client_id
JOIN Agencies a ON c.agency_id = a.agency_id;
