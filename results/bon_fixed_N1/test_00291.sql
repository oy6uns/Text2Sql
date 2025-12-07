SELECT co.order_id, co.order_date, co.order_status_code
FROM Customer_Orders co
JOIN Customers c ON co.customer_id = c.customer_id
WHERE c.customer_name = 'Jeromy';
