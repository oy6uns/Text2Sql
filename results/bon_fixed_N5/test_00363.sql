SELECT Service_Details
FROM Services
WHERE Service_ID IN (
    SELECT Service_ID
    FROM Customer_Interactions
    GROUP BY Service_ID
    HAVING COUNT(*) > 3
)
