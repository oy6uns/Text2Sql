WITH Gender_Order_Counts AS (
  SELECT c.gender_code, COUNT(o.order_id) AS order_count
  FROM Customers c
  LEFT JOIN Orders o ON c.customer_id = o.customer_id
  GROUP BY c.gender_code
), Min_Gender AS (
  SELECT gender_code
  FROM Gender_Order_Counts
  WHERE order_count = (SELECT MIN(order_count) FROM Gender_Order_Counts)
)
SELECT DISTINCT c.email_address, c.town_city, c.county
FROM Customers c
JOIN Min_Gender mg ON c.gender_code = mg.gender_code;
