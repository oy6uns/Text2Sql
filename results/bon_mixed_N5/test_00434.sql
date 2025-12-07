SELECT Discount.name
FROM Discount
JOIN (
    SELECT discount_id, COUNT(*) AS rental_count
    FROM Renting_history
    GROUP BY discount_id
    ORDER BY rental_count DESC
    LIMIT 1
) AS MostUsedDiscount ON Discount.id = MostUsedDiscount.discount_id;
