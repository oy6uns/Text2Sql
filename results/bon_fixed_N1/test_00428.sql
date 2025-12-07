SELECT c.name
FROM Customers c
JOIN Renting_history r ON c.id = r.customer_id
GROUP BY c.id, c.name
HAVING COUNT(r.id) >= 2;
