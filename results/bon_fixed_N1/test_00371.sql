SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cas ON c.Customer_ID = cas.Customer_ID
WHERE cas.Service_ID = (
    SELECT Service_ID
    FROM (
        SELECT Service_ID, COUNT(*) AS usage_count
        FROM Customers_and_Services
        GROUP BY Service_ID
        ORDER BY usage_count ASC
        LIMIT 1
    )
)
