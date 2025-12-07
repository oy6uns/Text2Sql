SELECT p.owner_user_id AS user_id, COUNT(pp.photo_filename) AS number_of_photos
FROM Properties p
LEFT JOIN Property_Photos pp ON p.property_id = pp.property_id
GROUP BY p.owner_user_id
ORDER BY p.owner_user_id;
