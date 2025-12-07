SELECT DISTINCT s.Name
FROM spokesman s
JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID
WHERE CAST(sd.Start_year AS INT) < 2004;
