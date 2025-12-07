SELECT o.date_order_placed
FROM Orders o
WHERE o.customer_id IN (
    SELECT customer_id
    FROM Customer_Payment_Methods
    GROUP BY customer_id
    HAVING COUNT(payment_method_code) >= 2
)
