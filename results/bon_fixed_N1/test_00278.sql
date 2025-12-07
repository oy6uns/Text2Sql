SELECT payment_method_code
FROM Customers
GROUP BY payment_method_code
ORDER BY COUNT(*) DESC
LIMIT 1;
