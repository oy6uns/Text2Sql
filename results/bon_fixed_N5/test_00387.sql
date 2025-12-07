SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID
JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = cs.Service_ID
JOIN Integration_Platform ip ON ip.Customer_Interaction_ID = ci.Customer_Interaction_ID
WHERE ci.Status_Code = 'failed' OR LOWER(ci.Status_Code) LIKE '%fail%'
