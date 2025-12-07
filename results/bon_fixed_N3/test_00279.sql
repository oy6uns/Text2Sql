WITH PaymentMethodCounts AS (
  SELECT payment_method_code, COUNT(*) AS customer_count
  FROM Customers
  GROUP BY payment_method_code
),
MinCount AS (
  SELECT MIN(customer_count) AS min_customer_count
  FROM PaymentMethodCounts
)
SELECT c.customer_name, c.payment_method_code
FROM Customers c
JOIN PaymentMethodCounts pmc ON c.payment_method_code = pmc.payment_method_code
JOIN MinCount mc ON pmc.customer_count = mc.min_customer_count;
