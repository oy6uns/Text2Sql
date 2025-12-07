SELECT COUNT(DISTINCT property_id)
FROM Properties
WHERE parking_lots = '1' OR garage_yn = '1';
