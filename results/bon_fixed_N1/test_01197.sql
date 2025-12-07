SELECT COUNT(*) 
FROM district d
LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID
WHERE sd.Spokesman_ID IS NULL;
