SELECT COUNT(*) 
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Customer_Orders o 
    WHERE o.customer_id = c.customer_id
)
