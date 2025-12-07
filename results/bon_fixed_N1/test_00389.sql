SELECT Service_Details 
FROM Services s
WHERE NOT EXISTS (
    SELECT 1 
    FROM Customers_and_Services cs 
    WHERE cs.Service_ID = s.Service_ID
)
