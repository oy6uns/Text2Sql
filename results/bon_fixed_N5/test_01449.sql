SELECT property_id, COUNT(*) AS photo_count
FROM Property_Photos
GROUP BY property_id;
