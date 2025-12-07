SELECT DISTINCT s.Service_Details
FROM Services s
LEFT JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID
LEFT JOIN Customers c ON cs.Customer_ID = c.Customer_ID
LEFT JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID
WHERE c.Customer_Details = 'Hardy Kutch' OR ci.Status_Code = 'good'
