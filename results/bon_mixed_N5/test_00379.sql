SELECT DISTINCT s.Service_Details
FROM Services s
JOIN Customers_and_Services cas ON s.Service_ID = cas.Service_ID
JOIN Customers c ON cas.Customer_ID = c.Customer_ID
JOIN Customer_Interactions ci ON ci.Customer_ID = c.Customer_ID AND ci.Service_ID = s.Service_ID
WHERE c.Customer_Details = 'Hardy Kutch'
  AND ci.Status_Code = 'bad'
