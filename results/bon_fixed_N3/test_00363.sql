SELECT s.Service_Details
FROM Services s
JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID
GROUP BY s.Service_ID, s.Service_Details
HAVING COUNT(*) > 3;
