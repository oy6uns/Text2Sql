SELECT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Details
ORDER BY COUNT(DISTINCT cs.Service_ID) DESC
LIMIT 1;
