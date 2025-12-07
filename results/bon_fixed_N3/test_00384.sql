SELECT DISTINCT c.Customer_Details
FROM Customer_Interactions ci
JOIN Customers c ON ci.Customer_ID = c.Customer_ID
JOIN Services s ON ci.Service_ID = s.Service_ID
JOIN Channels ch ON ci.Channel_ID = ch.Channel_ID
WHERE ci.Status_Code = 'Stuck'
  AND s.Service_Details LIKE '%bad%'
  AND ch.Channel_Details LIKE '%bad%'
