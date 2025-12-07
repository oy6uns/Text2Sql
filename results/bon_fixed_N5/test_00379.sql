SELECT DISTINCT s.Service_Details
FROM Services s
JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID
JOIN Customers c ON cs.Customer_ID = c.Customer_ID
JOIN Customer_Interactions ci ON ci.Service_ID = s.Service_ID AND ci.Customer_ID = c.Customer_ID
WHERE c.Customer_Details = 'Hardy Kutch'
  AND ci.Status_Code = 'bad'
