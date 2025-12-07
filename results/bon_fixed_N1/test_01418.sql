SELECT property_id, vendor_requested_price
FROM Properties
WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
