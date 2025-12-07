SELECT payment_method_code
FROM Customer_Payment_Methods
GROUP BY payment_method_code
ORDER BY COUNT(*) DESC
LIMIT 1;
