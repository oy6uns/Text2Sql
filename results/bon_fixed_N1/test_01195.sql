SELECT d.Name
FROM district d
JOIN spokesman_district sd ON d.District_ID = sd.District_ID
JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID
WHERE s.Rank_position IN (1, 2)
GROUP BY d.District_ID, d.Name
HAVING COUNT(DISTINCT s.Rank_position) = 2;
