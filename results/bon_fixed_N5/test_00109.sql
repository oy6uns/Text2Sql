SELECT o.date_order_placed
FROM Orders o
JOIN (
    SELECT customer_id
    FROM Customer_Payment_Methods
    GROUP BY customer_id
    HAVING COUNT(DISTINCT payment_method_code) >= 2
) cpm ON o.customer_id = cpm.customer_id;
