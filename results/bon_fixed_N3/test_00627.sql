SELECT Nationality, COUNT(Customer_ID) AS Number_of_Customers
FROM customer
GROUP BY Nationality;
