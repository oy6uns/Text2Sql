SELECT DISTINCT s.Service_Details
FROM Services s
JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID
JOIN Customers c ON cs.Customer_ID = c.Customer_ID
WHERE c.Customer_Details = 'Hardy Kutch'
