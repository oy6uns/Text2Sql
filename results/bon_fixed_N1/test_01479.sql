SELECT DISTINCT b.product_name
FROM bike b
JOIN cyclists_own_bikes cob ON b.id = cob.bike_id
JOIN cyclist c ON cob.cyclist_id = c.id
WHERE c.nation IN ('Russia', 'Great Britain')
