SELECT DISTINCT b.id, b.product_name
FROM bike b
JOIN cyclists_own_bikes cob ON b.id = cob.bike_id
WHERE cob.purchase_year > 2015;
