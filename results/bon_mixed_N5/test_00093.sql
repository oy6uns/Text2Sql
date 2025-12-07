SELECT COUNT(*) 
FROM Customers c
LEFT JOIN Customer_Payment_Methods pm ON c.customer_id = pm.customer_id
WHERE pm.payment_method_code IS NULL;
