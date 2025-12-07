SELECT DISTINCT o.date_order_placed
FROM Orders o
JOIN Customer_Payment_Methods cpm ON o.customer_id = cpm.customer_id
GROUP BY o.order_id, o.date_order_placed, o.customer_id
HAVING (SELECT COUNT(*) FROM Customer_Payment_Methods WHERE customer_id = o.customer_id) >= 2;
