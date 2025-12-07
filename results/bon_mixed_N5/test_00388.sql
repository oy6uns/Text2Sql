SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID
JOIN Integration_Platform ip ON ci.Customer_Interaction_ID = ip.Customer_Interaction_ID
WHERE ip.Integration_Platform_Details = 'Fail'
