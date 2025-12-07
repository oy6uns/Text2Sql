SELECT DISTINCT co.order_id, co.order_date
FROM Customer_Orders co
JOIN Order_Items oi ON co.order_id = oi.order_id
GROUP BY co.order_id, co.order_date
HAVING MAX(CAST(oi.order_quantity AS INTEGER)) > 6 OR COUNT(DISTINCT oi.product_id) > 3
