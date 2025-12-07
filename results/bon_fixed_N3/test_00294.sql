SELECT c.customer_name, c.customer_id, COUNT(co.order_id) AS number_of_orders
FROM Customers c
LEFT JOIN Customer_Orders co ON c.customer_id = co.customer_id
GROUP BY c.customer_name, c.customer_id;
