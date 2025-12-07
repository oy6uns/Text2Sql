SELECT c.Customer_Details
FROM Customers c
JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Details
ORDER BY COUNT(*) DESC
LIMIT 1;
