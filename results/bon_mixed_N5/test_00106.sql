SELECT email_address, town_city, county
FROM Customers
WHERE gender_code IN (
    SELECT gender_code
    FROM Customers
    GROUP BY gender_code
    HAVING COUNT(*) = (
        SELECT MIN(gender_count)
        FROM (
            SELECT COUNT(*) AS gender_count
            FROM Customers
            GROUP BY gender_code
        ) AS counts
    )
)
