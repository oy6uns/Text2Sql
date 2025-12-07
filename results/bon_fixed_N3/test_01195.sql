SELECT DISTINCT d.Name
FROM district d
JOIN spokesman_district sd ON d.District_ID = sd.District_ID
JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID
WHERE d.District_ID IN (
    SELECT District_ID
    FROM spokesman_district sd2
    JOIN spokesman s2 ON sd2.Spokesman_ID = s2.Spokesman_ID
    WHERE s2.Rank_position = 1
)
AND d.District_ID IN (
    SELECT District_ID
    FROM spokesman_district sd3
    JOIN spokesman s3 ON sd3.Spokesman_ID = s3.Spokesman_ID
    WHERE s3.Rank_position = 2
)
