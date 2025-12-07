SELECT d.Name, COUNT(sd.Spokesman_ID) AS Number_of_Spokesmen
FROM district d
LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID
GROUP BY d.Name
ORDER BY d.Name;
