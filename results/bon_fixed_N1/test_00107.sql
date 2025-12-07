WITH GenderOrderCounts AS (
  SELECT c.gender_code, COUNT(o.order_id) AS order_count
  FROM Customers c
  LEFT JOIN Orders o ON c.customer_id = o.customer_id
  GROUP BY c.gender_code
),
MinOrderGender AS (
  SELECT gender_code
  FROM GenderOrderCounts
  WHERE order_count = (SELECT MIN(order_count) FROM GenderOrderCounts)
)
SELECT DISTINCT c.email_address, c.town_city, c.county
FROM Customers c
JOIN MinOrderGender m ON c.gender_code = m.gender_code;
