SELECT Name
FROM customer c
LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID
WHERE co.Customer_ID IS NULL;
