SELECT COUNT(*) AS customers_without_orders
FROM Customers c
LEFT JOIN Customer_Orders co ON c.customer_id = co.customer_id
WHERE co.order_id IS NULL;
