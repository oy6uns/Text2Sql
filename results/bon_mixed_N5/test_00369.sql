SELECT Customer_Details
FROM Customers c
LEFT JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID
WHERE cs.Service_ID IS NULL;
