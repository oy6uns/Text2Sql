SELECT c.Name, co.Dish_Name
FROM customer_order co
JOIN customer c ON co.Customer_ID = c.Customer_ID;
