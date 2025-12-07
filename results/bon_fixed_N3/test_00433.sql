SELECT d.name
FROM Discount d
JOIN Renting_history r ON d.id = r.discount_id
GROUP BY d.name
ORDER BY COUNT(*) DESC
LIMIT 1;
