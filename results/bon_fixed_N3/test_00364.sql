SELECT s.Service_Details
FROM Customer_Interactions ci
JOIN Services s ON ci.Service_ID = s.Service_ID
GROUP BY s.Service_ID, s.Service_Details
HAVING COUNT(*) > 3;
