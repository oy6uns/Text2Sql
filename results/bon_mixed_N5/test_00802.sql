SELECT city_name
FROM City
WHERE city_code IN (
    SELECT city_code
    FROM Student
    GROUP BY city_code
    HAVING COUNT(*) >= 3
)
