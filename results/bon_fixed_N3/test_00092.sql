SELECT COUNT(*) 
FROM Customers c
LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id
WHERE cpm.payment_method_code IS NULL;
