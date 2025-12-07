SELECT c.Customer_Details
FROM Customers c
JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID
JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Details
ORDER BY COUNT(ci.Customer_Interaction_ID) DESC
LIMIT 1;
