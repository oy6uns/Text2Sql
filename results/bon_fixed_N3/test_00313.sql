SELECT DISTINCT co.order_date, co.order_id
FROM Customer_Orders co
JOIN Order_Items oi ON co.order_id = oi.order_id
GROUP BY co.order_id, co.order_date
HAVING MAX(CAST(oi.order_quantity AS INT)) > 6 OR COUNT(oi.product_id) > 3;
