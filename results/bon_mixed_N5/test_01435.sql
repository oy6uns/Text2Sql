SELECT rac.age_category_description
FROM Users u
JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code
WHERE u.user_id = (
    SELECT user_id
    FROM User_Searches
    ORDER BY search_datetime ASC
    LIMIT 1
)
