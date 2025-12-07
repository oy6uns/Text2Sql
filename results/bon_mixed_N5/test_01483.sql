SELECT b.product_name AS name, b.price
FROM bike b
JOIN cyclists_own_bikes cob1 ON b.id = cob1.bike_id
JOIN cyclist c1 ON cob1.cyclist_id = c1.id
JOIN cyclists_own_bikes cob2 ON b.id = cob2.bike_id
JOIN cyclist c2 ON cob2.cyclist_id = c2.id
WHERE c1.name = 'Bradley Wiggins' AND c2.name = 'Antonio Tauler';
