SELECT payment_method_code, COUNT(*) AS usage_count
FROM Customer_Payment_Methods
GROUP BY payment_method_code
ORDER BY usage_count DESC
LIMIT 1;
