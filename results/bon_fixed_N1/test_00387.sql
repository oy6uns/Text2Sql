SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cas ON c.Customer_ID = cas.Customer_ID
JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID AND cas.Service_ID = ci.Service_ID
JOIN Integration_Platform ip ON ci.Customer_Interaction_ID = ip.Customer_Interaction_ID
WHERE ci.Status_Code = 'failed';
