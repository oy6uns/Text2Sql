SELECT c.name
FROM Customers c
JOIN Renting_history rh ON c.id = rh.customer_id
GROUP BY c.id, c.name
HAVING COUNT(rh.id) >= 2;
