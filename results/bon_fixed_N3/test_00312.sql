SELECT customer_id
FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Customer_Orders
);
