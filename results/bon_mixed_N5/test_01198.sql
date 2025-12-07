SELECT Name
FROM spokesman s
LEFT JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID
WHERE sd.District_ID IS NULL;
