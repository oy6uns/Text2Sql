SELECT c.Customer_ID, c.Name, c.Nationality, c.Card_Credit, c.Level_of_Membership
FROM customer c
JOIN (
    SELECT Customer_ID, SUM(Quantity) AS total_quantity
    FROM customer_order
    GROUP BY Customer_ID
    HAVING SUM(Quantity) > 1
) co ON c.Customer_ID = co.Customer_ID;
