SELECT Discount.name
FROM Discount
JOIN Renting_history ON Discount.id = Renting_history.discount_id
GROUP BY Discount.id, Discount.name
ORDER BY COUNT(*) DESC
LIMIT 1;
