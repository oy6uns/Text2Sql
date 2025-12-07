SELECT d.Name
FROM district d
JOIN spokesman_district sd ON d.District_ID = sd.District_ID
GROUP BY d.District_ID, d.Name
HAVING COUNT(sd.Spokesman_ID) > 1;
