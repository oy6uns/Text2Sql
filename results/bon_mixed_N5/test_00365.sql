SELECT c.Customer_Details
FROM Customers c
JOIN (
    SELECT Customer_ID, COUNT(*) AS usage_count
    FROM Customer_Interactions
    GROUP BY Customer_ID
    ORDER BY usage_count DESC
    LIMIT 1
) ci ON c.Customer_ID = ci.Customer_ID;
