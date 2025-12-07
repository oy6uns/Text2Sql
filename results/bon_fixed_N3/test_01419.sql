SELECT property_id, MIN(vendor_requested_price) AS lowest_requested_price
FROM Properties
WHERE vendor_requested_price IS NOT NULL
GROUP BY property_id
ORDER BY lowest_requested_price
LIMIT 1;
