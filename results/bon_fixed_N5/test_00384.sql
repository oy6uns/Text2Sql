SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID
JOIN Services s ON ci.Service_ID = s.Service_ID
JOIN Channels ch ON ci.Channel_ID = ch.Channel_ID
WHERE ci.Status_Code = 'Stuck'
  AND ci.Services_and_Channels_Details LIKE '%bad%'
