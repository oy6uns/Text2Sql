SELECT p.Name, SUM(CAST(b.Sale_Amount AS FLOAT)) AS Total_Sale_Amount
FROM press p
JOIN book b ON p.Press_ID = b.Press_ID
GROUP BY p.Name;
