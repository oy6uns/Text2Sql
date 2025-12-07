SELECT Earpads, SUM(Quantity) AS total_quantity
FROM headphone
JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID
GROUP BY Earpads
ORDER BY total_quantity DESC
LIMIT 2;
