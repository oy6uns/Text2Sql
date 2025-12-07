SELECT Customer_Details 
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Customers_and_Services cs 
    WHERE cs.Customer_ID = c.Customer_ID
)
