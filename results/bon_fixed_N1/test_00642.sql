SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT DISTINCT Customer_ID FROM customer_order);
