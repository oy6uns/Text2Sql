SELECT ISBN, SUM(amount) AS total_amount_ordered
FROM Books_Order
GROUP BY ISBN;
