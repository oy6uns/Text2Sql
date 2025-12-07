SELECT p.Name, SUM(CAST(b.Sale_Amount AS NUMBER)) AS Total_Book_Sale_Amount
FROM press p
JOIN book b ON p.Press_ID = b.Press_ID
GROUP BY p.Name;
