SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cpm.payment_method_code
FROM Customers c
LEFT JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id;
