SELECT DISTINCT s.Service_Details
FROM Services s
JOIN Customers_and_Services cas ON s.Service_ID = cas.Service_ID
JOIN Customers c ON cas.Customer_ID = c.Customer_ID
LEFT JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID
WHERE c.Customer_Details = 'Hardy Kutch' OR ci.Status_Code = 'good'
