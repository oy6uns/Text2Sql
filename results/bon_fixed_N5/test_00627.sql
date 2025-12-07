SELECT Nationality, COUNT(Customer_ID) AS number_of_customers
FROM customer
GROUP BY Nationality;
