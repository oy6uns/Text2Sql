SELECT DISTINCT bike.id, bike.product_name
FROM bike
JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id
WHERE cyclists_own_bikes.purchase_year > 2015;
