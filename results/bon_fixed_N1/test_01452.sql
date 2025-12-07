SELECT SUM(p.price_max) AS total_max_price
FROM Properties p
JOIN Users u ON p.owner_user_id = u.user_id
JOIN Ref_User_Categories ruc ON u.user_category_code = ruc.user_category_code
WHERE ruc.user_category_description IN ('Single Mother', 'Student')
