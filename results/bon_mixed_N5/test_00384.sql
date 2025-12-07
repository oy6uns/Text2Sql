SELECT DISTINCT c.Customer_Details
FROM Customers c
JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID
WHERE ci.Status_Code = 'Stuck'
  AND ci.Services_and_Channels_Details LIKE '%bad%'
