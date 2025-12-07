SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID
JOIN (
    SELECT Service_ID
    FROM Customers_and_Services
    GROUP BY Service_ID
    ORDER BY COUNT(DISTINCT Customer_ID) ASC
    LIMIT 1
) least_used_service ON cs.Service_ID = least_used_service.Service_ID;
