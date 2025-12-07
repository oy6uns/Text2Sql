SELECT b.id, b.product_name
FROM bike b
JOIN cyclists_own_bikes cob ON b.id = cob.bike_id
GROUP BY b.id, b.product_name
HAVING COUNT(DISTINCT cob.cyclist_id) >= 4;
