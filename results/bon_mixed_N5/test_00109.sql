SELECT Orders.date_order_placed
FROM Orders
JOIN (
    SELECT customer_id
    FROM Customer_Payment_Methods
    GROUP BY customer_id
    HAVING COUNT(payment_method_code) >= 2
) AS multi_pay_customers ON Orders.customer_id = multi_pay_customers.customer_id;
