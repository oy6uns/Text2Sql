SELECT d.name
FROM Discount d
JOIN Renting_history rh ON d.id = rh.discount_id
GROUP BY d.name
ORDER BY COUNT(*) DESC
LIMIT 1;
