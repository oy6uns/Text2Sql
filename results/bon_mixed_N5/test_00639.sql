SELECT c.Name
FROM customer c
JOIN (
    SELECT Customer_ID
    FROM customer_order
    GROUP BY Customer_ID
    HAVING SUM(Quantity) > 1
) co ON c.Customer_ID = co.Customer_ID;
