SELECT COUNT(DISTINCT c.id)
FROM cyclist c
LEFT JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id AND cob.purchase_year > 2015
WHERE cob.bike_id IS NULL;
