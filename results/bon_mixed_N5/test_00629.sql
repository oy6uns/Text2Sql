SELECT Nationality
FROM customer
GROUP BY Nationality
ORDER BY COUNT(Customer_ID) DESC
LIMIT 1;
