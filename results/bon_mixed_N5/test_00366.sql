SELECT c.Customer_Details
FROM Customers c
JOIN (
    SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS service_count
    FROM Customers_and_Services
    GROUP BY Customer_ID
    ORDER BY service_count DESC
    LIMIT 1
) cs ON c.Customer_ID = cs.Customer_ID;
