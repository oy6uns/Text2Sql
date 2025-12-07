SELECT name 
FROM Customers 
WHERE id IN (
    SELECT customer_id 
    FROM Renting_history 
    GROUP BY customer_id 
    HAVING COUNT(*) >= 2
)
